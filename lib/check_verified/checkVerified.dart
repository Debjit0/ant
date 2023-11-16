import 'package:ant/Login%20Screen/login_Screen.dart';
import 'package:ant/screens/home_screen/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class CheckVerify extends StatefulWidget {
  const CheckVerify({super.key});

  @override
  State<CheckVerify> createState() => _CheckVerifyState();
}

class _CheckVerifyState extends State<CheckVerify> {
  bool conditions = false;
  bool isVerified = false;
  String accounttype = "";

  void initState() {
    // TODO: implement initState
    //super.initState();

    getVerificationStatus().then((value) => setState(
          () {},
        ));

    super.initState();
    //getVerificationStatus();
  }

  @override
  Widget build(BuildContext context) {
    return conditions == false
        ? Scaffold(
            body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        FirebaseAuth.instance
                            .signOut()
                            .whenComplete(() => Get.offAll(LoginScreen()));
                      },
                      child: Text("Logout")),
                  ElevatedButton(
                      onPressed: () {
                        print(FirebaseAuth.instance.currentUser!.uid);
                        getVerificationStatus().then((value) => setState(
                              () {},
                            ));
                      },
                      child: Text("Refresh")),
                ],
              ),
            ),
          ))
        : HomeScreen();
  }

  Future<bool> getVerificationStatus() async {
    DocumentSnapshot document = await FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    isVerified = document['isverified'];
    accounttype = document["accounttype"];
    if (isVerified == true && accounttype == "closer") {
      conditions = true;
      return true;
    } else {
      conditions = false;
      return false;
    }
  }
}
