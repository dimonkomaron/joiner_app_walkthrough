import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:joiner_app_walkthrough/controls/joiner_app_button.dart';
import 'package:joiner_app_walkthrough/controls/joiner_app_container.dart';
import 'package:joiner_app_walkthrough/router/router.dart';
import 'package:joiner_app_walkthrough/router/routes.dart';

class QuestionPage extends ConsumerWidget {
  const QuestionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: JoinerAppContainer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Expanded(child: SizedBox()),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 23.0,
                  vertical: 10,
                ),
                child: JoinerAppButton(
                  text: 'Show Result',
                  onPressed: () =>
                      ref.read(routerProvider).go(const ResultRoute().location),
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
