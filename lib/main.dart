import 'package:ant/Login%20Screen/login_Screen.dart';
import 'package:ant/Login%20Screen/phone.dart';
import 'package:ant/Splash%20Screen/splash.dart';
import 'package:ant/check_verified/checkVerified.dart';
import 'package:ant/screens/home_screen/home_screen.dart';
import 'package:ant/services/helper_functions.dart';
import 'package:ant/Signup%20Screen/aadhar.dart';
import 'package:ant/Signup%20Screen/signup_screen.dart';
import 'package:ant/theme/constants/project_colors.dart';
import 'package:ant/view_models/auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => AuthProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.black87,
          colorScheme: ColorScheme.fromSeed(seedColor: cYellow),
          useMaterial3: true,
        ),
        home: SplashScreen()
      ),
    );
  }
}
/*
class MyApp2 extends StatefulWidget {
  const MyApp2({super.key});

  @override
  State<MyApp2> createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
  bool _isSignedIn = false;
    @override
  void initState() {
    super.initState();
    getUserLoggedInStatus();
  }

  getUserLoggedInStatus() async {
    await HelperFunctions.getUserLoggedInStatus().then((value) {
      if (value != null) {
        setState(() {
          _isSignedIn = value;
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => AuthProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.black87,
          colorScheme: ColorScheme.fromSeed(seedColor: cYellow),
          useMaterial3: true,
        ),
        home: _isSignedIn? LoginScreen() : HomeScreen(),
      ),
    );
  }
}*/