import 'package:ant/Login%20Screen/login_Screen.dart';
import 'package:ant/screens/home_screen/home_screen.dart';
import 'package:ant/theme/constants/project_colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: cRed),
        useMaterial3: true,
      ),
      home: LoginScreen(),
    );
  }
}
