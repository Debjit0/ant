import 'package:ant/check_verified/checkVerified.dart';
import 'package:ant/screens/home_screen/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../view_models/auth_provider.dart';
import '../widget/widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final auth = FirebaseAuth.instance;
  bool? isVerified = false;
  checkauth() async {
    print('here');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? firstName = prefs.getString('firstName');
    Provider.of<AuthProvider>(context, listen: false).setFirstName =
        firstName.toString();
    isVerified = prefs.getBool('isVerified');
    if (isVerified == true) {
      nextPageOnly(context: context, page: HomeScreen());
    } else {
      nextPageOnly(
        context: context,
        page: CheckVerify(),
      );
    }
  }

  @override
  void initState() {
    checkauth();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //show screen for 2 secs
    // Future.delayed(const Duration(seconds: 2), () {
    //   //if user is authenticated then move to AuthPage else move to MainActivityPage
    //   if (auth.currentUser == null) {
    //     nextPageOnly(context: context, page: const LoginScreen());
    //   } else {
    //     nextPageOnly(context: context, page: const CheckVerify());
    //   }
    // });

    return const Scaffold(
      body: Center(
          child: FlutterLogo(
        size: 100,
      )),
    );
  }
}
