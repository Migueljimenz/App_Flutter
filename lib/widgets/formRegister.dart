// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, deprecated_member_use, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';

import '../ui/input_decorations.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  String? validateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value))
      return 'Enter a valid email address';
    else
      return null;
  }

  String? validatePassword(String? value) {
    if (value != null && value.length <= 6)
      return 'Password must be at least 6 characters';
    else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 30,
      left: 30,
      child: Material(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: 350,
            height: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.blueGrey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 200),
                  child: Text("Sign up",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(64, 77, 213, 0.8),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: TextFormField(
                    autocorrect: false,
                    autofocus: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => validateEmail(value),
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecorations.loginFormInput(
                        hintText: 'enter your email',
                        labelText: 'Email',
                        icon: Icons.alternate_email_sharp),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    obscureText: true,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecorations.loginFormInput(
                        hintText: 'enter your password',
                        labelText: 'Password',
                        icon: Icons.lock_outline),
                    validator: (value) => validatePassword(value),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  minWidth: 200.0,
                  height: 40.0,
                  onPressed: () {},
                  color: Color.fromRGBO(64, 77, 213, 0.8),
                  child: Text('Sign up',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
                MaterialButton(
                  minWidth: 200.0,
                  height: 40.0,
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, 'home'),
                  child: Text('¿ you have an account ?',
                      style: TextStyle(
                          color: Color.fromRGBO(64, 77, 213, 0.8),
                          fontSize: 20)),
                ),
              ],
            ),
          )),
    );
  }
}
