import 'package:flutter/material.dart';
import 'package:uas_final/themes.dart';

Container passwordFields() {
  TextEditingController password = TextEditingController();
  return Container(
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
  );
}
