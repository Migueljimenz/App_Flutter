// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Image(image: AssetImage('assets/logo3.png')),
              ),
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width,
              color: Color.fromRGBO(64, 77, 213, 0.8),
            ),
            Container(
              child: Container(),
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey[300],
            ),
          ],
        ),
        OpctionLinks()
      ],
    );
  }
}

class OpctionLinks extends StatelessWidget {
  const OpctionLinks({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: MediaQuery.of(context).size.width * 0.25,
        bottom: 50,
        child: Column(
          children: [
            MaterialButton(
              minWidth: 200.0,
              height: 40.0,
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, 'register'),
              child: Text('Sign up',
                  style: TextStyle(
                      color: Color.fromRGBO(64, 77, 213, 0.8), fontSize: 20)),
            ),
            MaterialButton(
              minWidth: 200.0,
              height: 40.0,
              onPressed: () {},
              child: Text('forgot password?',
                  style: TextStyle(
                      color: Color.fromRGBO(64, 77, 213, 0.8), fontSize: 20)),
            ),
          ],
        ));
  }
}
