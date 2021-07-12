import 'package:flutter/material.dart';
import 'package:uas_final/themes.dart';

Container confirmPaswordFields() {
  TextEditingController confirm = TextEditingController();
  return Container(
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
  );
}
