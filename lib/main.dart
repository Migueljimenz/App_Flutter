// ignore_for_file: use_key_in_widget_constructors, sized_box_for_whitespace, prefer_const_constructors

import 'package:app/providers/login_from_provider.dart';
import 'package:app/screen/product_screen.dart';
import 'package:app/services/products_service.dart';
import 'package:app/widgets/formRegister.dart';
import 'package:app/widgets/loginForm.dart';
import 'package:app/widgets/pageData.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:app/widgets/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const AppState());
}

class AppState extends StatelessWidget {
    const AppState({Key? key}) : super(key: key);
  
    @override
    Widget build(BuildContext context) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ProductService()),
        ],
        child: MyApp(),
      );
      
    }
  }



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      initialRoute: 'splash',
      routes: {
        'splash': (_) => SplashScreen(),
        'home': (_) => Home(),
        'login': (_) => LoginForm(),
        'register': (_) => RegisterForm(),
        'data': (_) => Data(),
        'product': (_) => ProductScreen(),
      },
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
          color: Color.fromRGBO(64, 77, 213, 0.8),
          elevation: 0,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Color.fromRGBO(64, 77, 213, 0.8),
          elevation: 0,
        ),
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: const Image(
        image: AssetImage('assets/logo2.png'),
      ),
      pageTransitionType: PageTransitionType.fade,
      duration: 5000,
      backgroundColor: Colors.white,
      splashTransition: SplashTransition.scaleTransition,
      nextScreen: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        HomePage(),
        ChangeNotifierProvider(
          create: (_) => LoginProvider(),
          child: LoginForm(),
        ),
      ],
    );
  }
}
