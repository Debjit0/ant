import 'package:flutter/material.dart';

class Aadhar extends StatelessWidget {
  const Aadhar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
              Container(
                child: Column(children: [
                  Container(),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor:
                          Theme.of(context).colorScheme.secondaryContainer,
                    ),
                    child: const Text('Upload front image'),
                  ),
                ]),
              ),
              Container(
                child: Column(children: [
                  Container(),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor:
                          Theme.of(context).colorScheme.secondaryContainer,
                    ),
                    child: const Text('Upload back image'),
                  ),
                ]),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 50,
                    child: FilledButton.tonal(
                      onPressed: () async {},
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
    );
  }
}
