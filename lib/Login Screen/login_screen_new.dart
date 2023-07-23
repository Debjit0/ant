import 'package:flutter/material.dart';

class LoginScreenNew extends StatelessWidget {
  const LoginScreenNew({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    height: (height - 32) * .6,
                    child: Image.asset("assets/images/login.png")),
                SizedBox(
                  height: (height - 32) * .4,
                  width: width - 32,
                  child: Card(
                    elevation: .7,
                    child: Form(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Card(
                              elevation: 1,
                              child: Container(
                                padding: const EdgeInsets.all(4.0),
                                width: width - 32 - 32,
                                child: Center(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.all(30),
                                      prefixIconConstraints: BoxConstraints(
                                        maxHeight: 80,
                                        minHeight: 80,
                                        maxWidth: 96,
                                        minWidth: 80,
                                      ),
                                      prefixIcon: Padding(
                                        padding: EdgeInsets.only(
                                          right: 16,
                                          left: 4.0,
                                          top: 4,
                                          bottom: 4,
                                        ),
                                        child: Card(
                                          elevation: 2,
                                          child: Center(child: Text('+91')),
                                        ),
                                      ),
                                      hintText: 'Your Mobile Number',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 80,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 2,
                                ),
                                onPressed: () {},
                                child: const Text("Get OTP"),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
