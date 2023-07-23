import 'package:ant/theme/app_theme.dart';
import 'package:flutter/material.dart';

import '../widget/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/loginR1.png"),
              Form(
                child: SizedBox(
                  height: 60,
                  width: MediaQuery.of(context).size.width - 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                          height: 60,
                          width: 90,
                          child: ElevatedButton(
                              style: FilledButton.styleFrom(
                                  //backgroundColor: Colors.black87,
                                  foregroundColor: Colors.black87),
                              onPressed: () {},
                              child: const Text("+91"))),
                      SizedBox(
                        height: 60,
                        width:
                            (MediaQuery.of(context).size.width - 40) - 90 - 16,
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: FilledButton.tonal(
                      onPressed: () {}, child: Text("Get OTP")))
            ],
          ),
        ),
      ),
    );
  }
}
