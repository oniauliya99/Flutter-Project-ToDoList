import 'package:flutter/material.dart';
import 'package:uas_final/themes.dart';
import 'package:uas_final/services/signin.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirm = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F6FD),
      body: Container(
        margin: EdgeInsets.only(top: 100),
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    'TODO',
                    style: poppinsBold.copyWith(fontSize: 40),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    'LIST',
                    style: poppinsBold.copyWith(
                        fontSize: 40, color: Color(0XFF29D8A1)),
                  ),
                ),
              ],
            ),

            // input email

            Container(
              color: Colors.transparent,
              margin: EdgeInsets.only(left: 30, right: 30, top: 20),
              height: 60,
              child: Container(
                margin: EdgeInsets.only(left: 20),
                alignment: Alignment.center,
                child: new TextFormField(
                  controller: email,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 2)),
                    hintText: 'Enter your email address',
                    prefixIcon: Icon(
                      Icons.email,
                    ),
                    hintStyle: poppinsRegular.copyWith(fontSize: 16),
                  ),
                  onChanged: (value) {},
                ),
              ),
            ),

            // input password

            Container(
              color: Colors.transparent,
              margin: EdgeInsets.only(left: 30, right: 30, top: 10),
              height: 60,
              child: Container(
                margin: EdgeInsets.only(left: 20),
                alignment: Alignment.center,
                child: new TextFormField(
                  controller: password,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 2)),
                    hintText: 'Enter your password',
                    prefixIcon: Icon(Icons.lock),
                    hintStyle: poppinsRegular.copyWith(fontSize: 16),
                  ),
                  onChanged: (value) {},
                ),
              ),
            ),

            // input konfirmasi password

            Container(
              color: Colors.transparent,
              margin: EdgeInsets.only(left: 30, right: 30, top: 10),
              height: 60,
              child: Container(
                margin: EdgeInsets.only(left: 20),
                alignment: Alignment.center,
                child: new TextFormField(
                  controller: confirm,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Confirm your password',
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 2)),
                    prefixIcon: Icon(Icons.lock),
                    hintStyle: poppinsRegular.copyWith(fontSize: 16),
                  ),
                  onChanged: (value) {},
                ),
              ),
            ),

            // tombol daftar

            Container(
              margin: EdgeInsets.only(left: 40, right: 40, top: 20),
              child: ElevatedButton(
                onPressed: () async {
                  signUpWithEmailAndPassword(
                          email: email.text, password: password.text)
                      .then((result) {
                    if (result != null) {
                      Navigator.pop(context, result);
                    } else {
                      Navigator.pop(context, result);
                    }
                  });
                },
                child: Text(
                  'Register',
                  style: poppinsBlack.copyWith(
                    fontSize: 16,
                    color: Color(0xffffffff),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0XFF28D8A1),
                  padding: EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
