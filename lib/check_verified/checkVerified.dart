import 'package:flutter/material.dart';
class CheckVerify extends StatefulWidget {
  const CheckVerify({super.key});

  @override
  State<CheckVerify> createState() => _CheckVerifyState();
}

class _CheckVerifyState extends State<CheckVerify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Wait until u get verified by our admins", style: TextStyle(color: Colors.white, fontSize: 20),)),
    );
  }
}