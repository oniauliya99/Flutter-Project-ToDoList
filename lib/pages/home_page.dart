import 'package:flutter/material.dart';
import 'package:uas_final/pages/dashboard_page.dart';
import 'package:uas_final/pages/signup_page.dart';
import 'package:uas_final/themes.dart';
import 'package:uas_final/services/signin.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController email, password;

  @override
  void initState() {
    email = TextEditingController();
    password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Judul Aplikasi
    var appTitle = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'TODO',
          style: poppinsBlack.copyWith(fontSize: 40, color: black),
        ),
        SizedBox(
          width: 8,
        ),
        Text('LIST', style: poppinsBlack.copyWith(fontSize: 40, color: green)),
      ],
    );

    // Teks remember me
    var rememberMe = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(
              'assets/images/check.png',
              width: 20,
              height: 20,
            ),
            SizedBox(
              width: 8,
            ),
            Text('Remember me',
                style: poppinsRegular.copyWith(fontSize: 16, color: black)),
          ],
        ),
        Text('Forgot password?',
            style: poppinsRegular.copyWith(
              fontSize: 16,
              color: green,
            )),
      ],
    );

    // Tombol daftar akun baru
    var signUpBtn = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Don’t have an account?',
          style: poppinsRegular.copyWith(fontSize: 16, color: black),
        ),
        SizedBox(
          width: 3,
        ),
        TextButton(
          // ke halaman daftar dengan email
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return SignUpPage();
            }));
          },
          child: Text(
            'Signup here',
            style: poppinsRegular.copyWith(
              fontSize: 16,
              color: green,
            ),
          ),
        ),
      ],
    );

    // Tombol login Google
    var loginGoogleBtn = SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        // login menggunakan akun google
        onPressed: () {
          signInWithGoogle().then((result) {
            if (result != null) {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return DashboardPage();
              }));
            }
          });
        },
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/google.png',
                width: 25,
                height: 25,
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                'SIGN IN WITH GOOGLE',
                style: poppinsBlack.copyWith(
                    fontSize: 16, color: Color(0xff4285F4)),
              ),
            ],
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 12),
        ),
      ),
    );

    // Tombol login dengan email
    var loginEmailBtn = SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          signInWithEmailAndPassword(email: email.text, password: password.text)
              .then((value) => {
                    if (value != null)
                      {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return DashboardPage();
                        }))
                      }
                  });
        },
        child: Text(
          'LOGIN',
          style: poppinsBlack.copyWith(
            fontSize: 16,
            color: Color(0xffffffff),
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: green,
          padding: EdgeInsets.symmetric(vertical: 12),
        ),
      ),
    );

    return Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),

                // Judul Aplikasi
                appTitle,

                SizedBox(
                  height: 20,
                ),

                // Kolom Input - Email
                textField(
                    controller: email,
                    hintText: "Enter email..",
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: green,
                    )),

                SizedBox(
                  height: 16,
                ),

                // Kolom Input - Password
                textField(
                    controller: password,
                    hintText: "Enter password..",
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      color: green,
                    ),
                    secure: true),

                SizedBox(
                  height: 20,
                ),

                // Opsi tambahan
                rememberMe,
                SizedBox(
                  height: 20,
                ),

                // Login dengan Email
                loginEmailBtn,

                SizedBox(
                  height: 3,
                ),

                // Tombol daftar akun
                signUpBtn,
                SizedBox(
                  height: 50,
                ),

                // Login dengan Google
                loginGoogleBtn,
              ],
            ),
          ),
        ));
  }

  // Textfield dinamis

  TextFormField textField(
      {String hintText = "Text here",
      var prefixIcon = const Icon(Icons.email_outlined),
      var controller,
      bool secure = false}) {
    //
    return TextFormField(
      maxLines: 1,
      autofocus: true,
      controller: controller,
      obscureText: secure,
      // decoration
      decoration: InputDecoration(
        hintText: hintText,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: green,
            width: 2,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
          color: grey,
          width: 2,
        )),
        prefixIcon: prefixIcon,
      ),
    );
  }
}
