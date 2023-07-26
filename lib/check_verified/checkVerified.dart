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
    return Scaffold(
      body: Column(
        
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Wait until u get verified",style: TextStyle(color: Colors.white),),
          ElevatedButton(onPressed: (){
            FirebaseAuth.instance.signOut();
            nextPageOnly(context: context, page: LoginScreen());
          }, child: Text("Logout")),
        ],
      )
    );
  }
}