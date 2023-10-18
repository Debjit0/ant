import 'dart:io';

import 'package:ant/check_verified/checkVerified.dart';
import 'package:ant/services/firebase_services/upload_aadhar_image.dart';
import 'package:ant/Signup%20Screen/utils/pick_image.dart';
import 'package:ant/view_models/auth_provider.dart';
import 'package:ant/widget/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
                          addAadhar(
                                  uid: uid,
                                  aadharFront: File(aadharFront),
                                  aadharBack: File(aadharBack),
                                  firstName: authProvider.firstName,
                                  lastName: authProvider.lastName,
                                  email: authProvider.email)
                              .then((value) => nextPageOnly(
                                  context: context, page: const CheckVerify()));
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

  Future addAadhar({
    File? aadharFront,
    File? aadharBack,
    String? uid,
    String? firstName,
    String? lastName,
    String? email,
  }) async {
 
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final FirebaseStorage _storage = FirebaseStorage.instance;
    CollectionReference userCollection = _firestore.collection("Users");
    String aadharFrontPath = "";
    String aadharBackPath = "";
    try {
 

      final aadharFrontName = aadharFront!.path.split('/').last;
      final aadharBackName = aadharBack!.path.split('/').last;
      //front
      await _storage
          .ref()
          .child("$uid/aadhar/$aadharFrontName")
          .putFile(aadharFront)
          .whenComplete(() async {
        await _storage
            .ref()
            .child("$uid/aadhar/$aadharFrontName")
            .getDownloadURL()
            .then((value) {
          aadharFrontPath = value;
        });
      });
      //back
      await _storage
          .ref()
          .child("$uid/aadhar/$aadharBackName")
          .putFile(aadharBack)
          .whenComplete(() async {
        await _storage
            .ref()
            .child("$uid/aadhar/$aadharBackName")
            .getDownloadURL()
            .then((value) {
          aadharBackPath = value;
        });

        final data = {
          'isverified': false,
          'firstname': firstName,
          'lastname': lastName,
          'email': email,
          'uid': uid,
          'aadharfront': aadharFrontPath,
          'aadharback': aadharBackPath,
          'accounttype': 'closer',
          'isRegistered': true
        };

        await userCollection.doc(uid).set(data);
      });
    } on FirebaseException catch (e) {
      print(e);
    } on SocketException catch (e) {
      print(e);
    } catch (e) {
      print(e);
    }
  }
}
