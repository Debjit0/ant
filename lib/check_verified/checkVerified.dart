import 'package:ant/Login%20Screen/login_Screen.dart';
import 'package:ant/widget/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CheckVerify extends StatefulWidget {
  const CheckVerify({super.key});

  @override
  State<CheckVerify> createState() => _CheckVerifyState();
}

class _CheckVerifyState extends State<CheckVerify> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(
      children: [
        SizedBox(
          height: height,
          width: width,
        ),
        SizedBox(
          height: height * .7,
          width: width,
          child: Image.asset(
            'assets/images/background.jpg',
            fit: BoxFit.fitWidth,
          ),
        ),
        Container(
          height: height * .7,
          width: width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.black38,
                  Colors.black87.withOpacity(1),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0, 1],
                tileMode: TileMode.clamp),
          ),
        ),
        Positioned(
          bottom: height * .1,
          child: SizedBox(
            width: width - 32,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Wait until u get verified".toUpperCase(),
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    fontSize: 32,
                  ),
                ),
                const SizedBox(height: 56),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FilledButton.tonal(
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                        nextPageOnly(
                            context: context, page: const LoginScreen());
                      },
                      child: Text(
                        "Logout".toUpperCase(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
