import 'package:flutter/material.dart';

final textInputDecoration = InputDecoration(
    labelStyle: const TextStyle(color: Colors.black),
    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0),
        borderSide: const BorderSide(color: Color(0xFFF50057), width: 2)),
    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0),
      borderSide: const BorderSide(color: Color(0xFFF50057), width: 2,),
    ),
    errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0),
        borderSide: const BorderSide(color: Color(0xFFF50057), width: 2)));

void nextPage({Widget? page, BuildContext? context}) {
  Navigator.push(context!, MaterialPageRoute(builder: (_) => page!));
}

void nextPageOnly({Widget? page, BuildContext? context}) {
  Navigator.pushAndRemoveUntil(
      context!, MaterialPageRoute(builder: (_) => page!), (route) => false);
}

void showAlert(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
