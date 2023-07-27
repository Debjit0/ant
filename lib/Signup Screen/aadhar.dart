import 'dart:io';

import 'package:ant/check_verified/checkVerified.dart';
import 'package:ant/services/firebase_services/upload_aadhar_image.dart';
import 'package:ant/Signup%20Screen/utils/pick_image.dart';
import 'package:ant/view_models/auth_provider.dart';
import 'package:ant/widget/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Aadhar extends StatefulWidget {
  const Aadhar({super.key});

  @override
  State<Aadhar> createState() => _AadharState();
}

class _AadharState extends State<Aadhar> {
  String aadharFront = "";
  String aadharBack = "";

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context);
    print(authProvider.firstName);
    print(authProvider.lastName);
    print(authProvider.email);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Please Upload Image of Your Aadhar Card'.toUpperCase(),
                  style: TextStyle(
                    fontSize: 32,
                    color: Theme.of(context).colorScheme.secondaryContainer,
                  ),
                ),
                aadharFront == ""
                    ? Container(
                        child: Column(children: [
                          Container(),
                          TextButton(
                            onPressed: (() {
                              pickImage().then((value) {
                                setState(() {
                                  aadharFront = value;
                                });
                              });
                            }),
                            style: TextButton.styleFrom(
                              foregroundColor: Theme.of(context)
                                  .colorScheme
                                  .secondaryContainer,
                            ),
                            child: const Text('Upload front image'),
                          ),
                        ]),
                      )
                    : Center(
                        child: SizedBox(
                            height: 300,
                            width: 300,
                            child: Image.file(File(aadharFront))),
                      ),
                aadharBack == ""
                    ? Container(
                        child: Column(children: [
                          Container(),
                          TextButton(
                            onPressed: (() {
                              pickImage().then((value) {
                                setState(() {
                                  aadharBack = value;
                                });
                              });
                            }),
                            style: TextButton.styleFrom(
                              foregroundColor: Theme.of(context)
                                  .colorScheme
                                  .secondaryContainer,
                            ),
                            child: const Text('Upload back image'),
                          ),
                        ]),
                      )
                    : Center(
                        child: SizedBox(
                            height: 300,
                            width: 300,
                            child: Image.file(File(aadharBack))),
                      ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 50,
                      child: FilledButton.tonal(
                        onPressed: () async {
                          final uid = FirebaseAuth.instance.currentUser!.uid;
                          UploadAadharProvider().addAadhar(
                              uid: uid,
                              aadharFront: File(aadharFront),
                              aadharBack: File(aadharBack),
                              firstName: authProvider.firstName,
                              lastName: authProvider.lastName,
                              email: authProvider.email);
                          nextPageOnly(context: context, page: const CheckVerify());
                        },
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Verify"),
                            Icon(
                              Icons.keyboard_arrow_right_rounded,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
