import 'package:ant/theme/app_theme.dart';
import 'package:ant/theme/constants/project_colors.dart';
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
              child: Text(
                'Home',
                style: AppTheme.smallButtonTextStyle
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            FilledButton(
              onPressed: () {},
              child: Text(
                'Home',
                style: AppTheme.smallButtonTextStyle
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            FilledButton.tonal(onPressed: () {}, child: const Text('Home')),
            OutlinedButton(onPressed: () {}, child: const Text('Home')),
          ],
        ),
      ),
    );
  }
}
