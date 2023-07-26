import 'package:ant/Login%20Screen/login_Screen.dart';
import 'package:ant/check_verified/checkVerified.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widget/widgets.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    //show screen for 2 secs
    Future.delayed(const Duration(seconds: 2), () {
      //if user is authenticated then move to AuthPage else move to MainActivityPage
      if (auth.currentUser == null) {
        nextPageOnly(context: context, page: LoginScreen());
      } else {
        nextPageOnly(context: context, page: CheckVerify());
      }
    });

    return Scaffold(
      body: Center(
          child: FlutterLogo(
        size: 100,
      )),
    );
  }
}