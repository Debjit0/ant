import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class CustomTFF extends StatelessWidget {
  final String text;
  const CustomTFF({required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(16),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: AppTheme.buttonTextFamily,
          fontSize: AppTheme.buttonFontSizeLarge,
          fontWeight: AppTheme.buttonFontWeight,
        ),
      ),
    );
  }
}
