import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

String name;
String email;
String imageUrl;
String uid;

// login menggunakan Google
Future<String> signInWithGoogle() async {
  await Firebase.initializeApp();

  // Membuka tampilan pilihan akun yang tersedia di perangkat user
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();

  // melakukan autentikasi untuk mendapatkan detail infromasi user dari akun tersebut
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  // mendapatkan token
  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final UserCredential authResult =
      await _auth.signInWithCredential(credential);
  // mengelompokkan data menjadi objek user
  final User user = authResult.user;

  if (user != null) {
    // Checking if email and name is null
    assert(user.email != null);
    assert(user.displayName != null);
    assert(user.photoURL != null);

    name = user.displayName;
    email = user.email;
    imageUrl = user.photoURL;
    uid = user.uid;

    // Only taking the first part of the name, i.e., First Name
    if (name.contains(" ")) {
      name = name.substring(0, name.indexOf(" "));
    }

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final User currentUser = _auth.currentUser;
    assert(user.uid == currentUser.uid);

    print('signInWithGoogle succeeded: $user');

    return '$user';
  }

  return null;
}

// login menggunakan email dan password
Future<String> signInWithEmailAndPassword(
    {String email, String password}) async {
  await Firebase.initializeApp();
  try {
    UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email, password: password);

    User user = result.user;

    assert(user != null);
    assert(await user.getIdToken() != null);

    name = user.email;
    uid = user.uid;

    if ((name).contains('@')) {
      name = (user.email).substring(0, (name).indexOf('@'));
    }

    return name;
  } catch (e) {
    print(e.toString());
    return null;
  }
}

// daftar menggunakan email dan pasword
Future<User> signUpWithEmailAndPassword({String email, String password}) async {
  await Firebase.initializeApp();

  try {
    UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    User user = result.user;

    assert(user != null);
    assert(await user.getIdToken() != null);

    return user;
  } catch (e) {
    print(e.toString());
    return null;
  }
}

// keluard dari akun
Future<void> signOutGoogle() async {
  await _auth?.signOut();
  await googleSignIn.signOut();

  imageUrl = null;
  email = null;
  name = null;
  uid = null;

  print("User Signed Out");
}
