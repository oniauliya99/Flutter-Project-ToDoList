import 'package:flutter/material.dart';
import 'package:uas_final/themes.dart';

Container registerCard() {
  return Container(
    margin: EdgeInsets.only(left: 40, right: 40, top: 30),
    height: 65,
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Color(0XFF28D8A1),
      child: ListTile(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(
                'Register',
                style: poppinsBold.copyWith(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
