import 'dart:async';

import 'package:ant/view_models/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  checkauth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? firstName = await prefs.getString('firstName');
    Provider.of<AuthProvider>(context, listen: false).setFirstName = firstName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'ANT',
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondaryContainer,
          ),
        ),
      ),
    );
  }
}
