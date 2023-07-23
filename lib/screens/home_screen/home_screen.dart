import 'package:ant/theme/app_theme.dart';
import 'package:ant/theme/constants/project_colors.dart';
import 'package:ant/widget/custom_textformfield.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(16),
              ),
              child: const Text('Home',
                  style: TextStyle(
                    fontFamily: AppTheme.buttonTextFamily,
                    fontSize: AppTheme.buttonFontSizeLarge,
                    fontWeight: AppTheme.buttonFontWeight,
                  )),
            ),
            FilledButton(
              onPressed: () {},
              child: Text('Home'),
            ),
            FilledButton.tonal(onPressed: () {}, child: Text('Home')),
            OutlinedButton(onPressed: () {}, child: Text('Home')),
            CustomTFF(text: "Hello"),
          ],
        ),
      ),
    );
  }
}
