import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:joiner_app_walkthrough/router/router.dart';
import 'package:joiner_app_walkthrough/router/routes.dart';

class QuestionPage extends ConsumerWidget {
  const QuestionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Expanded(child: SizedBox()),
            FilledButton(
              onPressed: () =>
                  ref.read(routerProvider).go(const ResultRoute().location),
              child: const Text('Result'),
            ),
          ],
        ),
      ),
    );
  }
}
