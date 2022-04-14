// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, deprecated_member_use, file_names, unnecessary_null_comparison, curly_braces_in_flow_control_structures, unused_import

import 'package:app/providers/login_from_provider.dart';
import 'package:app/ui/input_decorations.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

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

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginProvider>(context);

    return Positioned(
      top: 180,
      right: 30,
      left: 30,
      child: SingleChildScrollView(
        child: Material(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: 350,
              height: 350,
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
              child: Form(
                key: loginForm.formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text("Sign in",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(64, 77, 213, 0.8),
                          )),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: TextFormField(
                        autocorrect: false,
                        autofocus: true,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecorations.loginFormInput(
                            hintText: 'enter your email',
                            labelText: 'Email',
                            icon: Icons.alternate_email_sharp),
                        onChanged: (value) => loginForm.email = value,
                        validator: (value) => validateEmail(value),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: TextFormField(
                        obscureText: true,
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecorations.loginFormInput(
                            hintText: 'enter your password',
                            labelText: 'Password',
                            icon: Icons.lock_outline),
                        onChanged: (value) => loginForm.password = value,
                        validator: (value) => validatePassword(value),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      disabledColor: Colors.grey,
                      minWidth: 200.0,
                      height: 40.0,
                      color: Color.fromRGBO(64, 77, 213, 0.8),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Text(
                            loginForm.isLoading ? 'espere...' : 'sing in',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                      ),
                      onPressed: loginForm.isLoading
                          ? null
                          : () async {
                              FocusScope.of(context).unfocus();
                              if (loginForm.isValidForm()) {
                                loginForm.isLoading = true;

                                await Future.delayed(Duration(seconds: 3));
                                loginForm.isLoading = false;
                                Navigator.pushReplacementNamed(context, 'data');
                              }
                            },
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
