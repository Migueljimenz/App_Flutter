// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration loginFormInput(
      {required String labelText, required String hintText, IconData? icon}) {
    return InputDecoration(
      labelText: labelText,
      labelStyle: TextStyle(
        fontSize: 15,
        color: Colors.grey,
      ),
      hintText: hintText,
      hintStyle: TextStyle(fontSize: 15),
      icon: icon == null ? null : Icon(icon),
    );
  }
}
