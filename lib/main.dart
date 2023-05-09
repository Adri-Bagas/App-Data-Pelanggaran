import 'package:app_data_pelanggaran/ForgetPassword.dart';
import 'package:app_data_pelanggaran/Form.dart';
import 'package:app_data_pelanggaran/IntroScreen.dart';
import 'package:app_data_pelanggaran/SignUp.dart';
import 'package:app_data_pelanggaran/login_page.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
          splash: Icons.star,
          duration: 3000,
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          nextScreen: Forminput()),
    );
  }
}
