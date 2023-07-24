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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
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
              bottom: 10,
              child: Container(
                height: 300,
                width: width,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Image.asset("assets/images/login.png"),
                    Form(
                      child: SizedBox(
                        // height: 60,
                        width: MediaQuery.of(context).size.width - 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SizedBox(
                                height: 60,
                                width: 90,
                                child: FilledButton.tonal(
                                    onPressed: () {},
                                    child: const Text("+91"))),
                            SizedBox(
                              width: (MediaQuery.of(context).size.width - 40) -
                                  90 -
                                  16,
                              child: TextFormField(
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a phone number';
                                  } else if (value.length < 7 ||
                                      value.length > 15) {
                                    return 'PLease enter a valid phone number';
                                  }
                                },
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100),
                                    borderSide: BorderSide(),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100),
                                    borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .surfaceVariant,
                                    ),
                                  ),
                                  hintText: 'Enter Your mobile number',
                                  hintStyle:
                                      const TextStyle(color: Colors.white70),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: FilledButton.tonal(
                            onPressed: () {}, child: const Text("Get OTP")))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
