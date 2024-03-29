import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:joiner_app_walkthrough/controls/joiner_app_button.dart';
import 'package:joiner_app_walkthrough/controls/joiner_app_container.dart';
import 'package:joiner_app_walkthrough/features/home/providers/home_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: JoinerAppContainer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Expanded(
              child: Center(
                child: Text(
                  'Welcome to Joiner\'s App!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 23.0,
                  vertical: 10,
                ),
                child: JoinerAppButton(
                  onPressed: () {
                    ref.read(homeProvider.notifier).openQuestionnaire();
                  },
                  text: 'Start',
                  fontSize: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
