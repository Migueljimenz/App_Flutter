// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Products')),
      ),
      body: Center(
        child: CircularProgressIndicator(
          color: Color.fromRGBO(64, 77, 213, 0.8),
        ),
      ),
    );
  }
}
