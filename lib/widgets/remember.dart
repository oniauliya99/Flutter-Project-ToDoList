import 'package:flutter/material.dart';
import 'package:uas_final/themes.dart';

Container rememberMe() {
  return Container(
    margin: EdgeInsets.only(top: 20),
    child: Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Image.asset(
            'assets/images/check.png',
            width: 24,
            height: 24,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 10),
          child: Text(
            'Remember me',
            style: poppinsRegular.copyWith(fontSize: 15, color: Colors.black),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 60),
          child: Text(
            'Forgot password ?',
            style:
                poppinsRegular.copyWith(fontSize: 15, color: Color(0XFF28D8A1)),
          ),
        ),
      ],
    ),
  );
}
