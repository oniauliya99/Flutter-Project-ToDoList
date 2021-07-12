import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uas_final/pages/home_page.dart';
import 'package:uas_final/pages/input_page.dart';
import 'package:uas_final/themes.dart';
import 'package:uas_final/widgets/card_todo.dart';
import 'package:uas_final/services/signin.dart';
import 'package:uas_final/services/database.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  // Pointer yang menghubungkan ke collection dari firebase store
  final CollectionReference noteCollections = firestore.collection('notes');

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Header aplikasi yang berisi nama pengguna saat login
    var header = Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50,
            height: 50,
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                // Jika gambar avatar user bernilai null, maka pakai gambar default dari internet.

                (imageUrl != null)
                    ? imageUrl
                    : 'https://d1nhio0ox7pgb.cloudfront.net/_img/o_collection_png/green_dark_grey/256x256/plain/user.png',
              ),
            ),
          ),
          SizedBox(
            width: 22,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Halo',
                style: poppinsBold.copyWith(fontSize: 22, color: black),
              ),
              Text(
                // Jika nama user bernilai null, maka gunakan 'no name' sebagai namanya. Jika tidak
                // gunakan nama yang tersedia dari akunnya.

                (name != null) ? name : 'no name',
                style: poppinsBold.copyWith(fontSize: 22, color: green),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          Spacer(),
          IconButton(
              onPressed: () {
                // logout akun
                signOutGoogle();

                // kembali ke halaman login
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) {
                  return HomePage();
                }), ModalRoute.withName('/'));
              },
              icon: Icon(
                Icons.logout,
                color: Colors.red,
                size: 25,
              )),
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: grey.withOpacity(0.5),
            blurRadius: 0.5,
            offset: Offset.fromDirection(1.0),
          ),
        ],
      ),
    );

    // Daftar kartus

    var listOfCard = Expanded(
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: StreamBuilder<QuerySnapshot>(
          // Mengambil data secara realtime dari firebase
          stream: Database
              .readNotes(), // Ambil data dari collection 'notes' diurutkan berdasarkan title
          builder: (_, snapshot) {
            // jika terjadi error dalam pengambilan data, maka tampilkan pesan error

            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            // jika masih mendapatkan data, tampilkan pesan loading

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Column(
                children: [
                  Text('Loading..'),
                  SizedBox(
                    height: 8,
                  ),
                  CircularProgressIndicator(),
                ],
              );
            }

            // jika data berhasil didapatkan, maka tampilkan menjadi daftar card

            if (snapshot.hasData) {
              return ListView(
                  children: snapshot.data.docs
                      .map((e) => TodoCard(
                            e['title'], // title
                            e['description'], // description
                            e.id, // id note
                            onDelete: () {
                              noteCollections.doc(e.id).delete();
                            },
                          ))
                      .toList());
            } else {
              return Text('Tidak ada data');
            }
          },
        ),
      ),
    );

    // Main section

    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          header,
          listOfCard,
        ],
      )),

      // Floating Button

      floatingActionButton: Container(
        child: FittedBox(
          child: FloatingActionButton(
            // pergi ke halaman input catatan
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return InputPage();
              }));
            },
            child: Icon(Icons.post_add_outlined),
            backgroundColor: green,
            tooltip: 'Tambah catatan baru',
          ),
        ),
        width: 65,
        height: 65,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
