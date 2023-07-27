import 'package:ant/Login%20Screen/login_Screen.dart';
import 'package:ant/check_verified/checkVerified.dart';
import 'package:ant/screens/home_screen/home_screen.dart';
import 'package:ant/Signup%20Screen/signup_screen.dart';
import 'package:ant/widget/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyVerify extends StatefulWidget {
  const MyVerify({Key? key}) : super(key: key);

  @override
  State<MyVerify> createState() => _MyVerifyState();
}

class _MyVerifyState extends State<MyVerify> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  var code = "";
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  bool isReg = true;
  bool isVerified = false;
  checkUserReg() async {
    var resp = await firestore.collection('Users').get();
    final allUsers = resp.docs.map((doc) => doc.data()).toList();

    int idx = allUsers
        .indexWhere((e) => e['uid'] == FirebaseAuth.instance.currentUser!.uid);
    if (idx != -1) {
      isReg = true;
    } else {
      isReg = false;
    }
    isVerified = allUsers[idx]['isverified'];
    if (isVerified == true) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isVerified', true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
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
            child: Container(
              // height: 300,
              width: width,
              padding: const EdgeInsets.only(left: 16, right: 16),
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /*Image.asset(
                      'assets/image/loginR.png',
                      width: 150,
                      height: 150,
                    ),*/
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Phone Verification",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondaryContainer,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Pinput(
                      length: 6,
                      onChanged: (value) {
                        code = value;
                      },
                      showCursor: true,
                      onCompleted: (pin) => print(pin),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 44,
                      child: FilledButton.tonal(
                          // style: ElevatedButton.styleFrom(
                          //     shape: RoundedRectangleBorder(
                          //         borderRadius: BorderRadius.circular(10))),
                          onPressed: () async {
                            try {
                              PhoneAuthCredential credential =
                                  PhoneAuthProvider.credential(
                                      verificationId: LoginScreen.verify,
                                      smsCode: code);

                              // Sign the user in (or link) with the credential
                              await auth.signInWithCredential(credential);
                              await checkUserReg();

                              isReg
                                  ? isVerified
                                      ? nextPageOnly(
                                          context: context,
                                          page: const HomeScreen(),
                                        )
                                      : nextPageOnly(
                                          context: context,
                                          page: CheckVerify(),
                                        )
                                  : nextPageOnly(
                                      context: context,
                                      page: const SignupScreen());
                            } catch (e) {
                              print('verify error');
                              print(e);
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Center(
                                    child: Text(e.toString()),
                                  ),
                                ),
                              );
                            }
                          },
                          child: const Text("Verify Phone Number")),
                    ),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            nextPageOnly(
                              context: context,
                              page: const LoginScreen(),
                            );
                          },
                          child: const Text(
                            "Edit Phone Number",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
