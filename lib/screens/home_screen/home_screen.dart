import 'package:ant/theme/app_theme.dart';
import 'package:ant/theme/constants/project_colors.dart';
import 'package:ant/view_models/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var _authProvider = Provider.of<AuthProvider>(context);
    var _firstName = _authProvider.firstName;
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
