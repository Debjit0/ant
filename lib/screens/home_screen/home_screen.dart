import 'package:ant/theme/app_theme.dart';
import 'package:ant/theme/constants/project_colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Card(
              elevation: 4,
              surfaceTintColor: Theme.of(context).colorScheme.surfaceTint,
              child: const SizedBox(
                height: 50,
                width: 50,
              ),
            ),
            Card(
              elevation: 4,
              surfaceTintColor: Theme.of(context).colorScheme.surfaceTint,
              child: const SizedBox(
                height: 50,
                width: 50,
              ),
            ),
            Card(
              elevation: 0,
              color: Theme.of(context).colorScheme.primary,
              surfaceTintColor: Theme.of(context).colorScheme.surfaceTint,
              child: const SizedBox(
                height: 50,
                width: 50,
              ),
            ),
            Card(
              elevation: 4,
              surfaceTintColor: Theme.of(context).colorScheme.surfaceTint,
              child: const SizedBox(
                height: 50,
                width: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
