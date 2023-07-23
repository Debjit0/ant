

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
              SizedBox(
                width: MediaQuery.of(context).size.width*0.9,
                height: 60,
                child: Row(
                  children: [
                    ElevatedButton(onPressed: (){}, child: Text("+91")),
                    SizedBox(
                      width: 200,
                      height: 60,
                      child: TextFormField(
                        
                        decoration: textInputDecoration.copyWith(
                          labelText: "Phone Number",
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
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
