import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:joiner_app_walkthrough/controls/joiner_app_button.dart';
import 'package:joiner_app_walkthrough/controls/joiner_app_container.dart';
import 'package:joiner_app_walkthrough/features/questionnaire/questions_list/providers/flow_pages_states_provider.dart';
import 'package:joiner_app_walkthrough/router/router.dart';
import 'package:joiner_app_walkthrough/router/routes.dart';

class ResultPage extends ConsumerWidget {
  final bool skipped;

  const ResultPage({
    super.key,
    required this.skipped,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: _Body(skipped: skipped),
      ),
    );
  }
}

class _Body extends ConsumerWidget {
  final bool skipped;

  const _Body({
    required this.skipped,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return JoinerAppContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: skipped
                ? const Center(
                    child: Text(
                      'You can try again later!',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                  )
                : const _ResultsListView(),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 23.0,
                vertical: 10,
              ),
              child: JoinerAppButton(
                onPressed: () {
                  ref.read(routerProvider).go(const HomeRoute().location);
                },
                text: 'Agree & Complete',
                fontSize: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ResultsListView extends ConsumerWidget {
  const _ResultsListView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var flowPagesStates = ref.watch(flowPagesStatesProvider);

    return flowPagesStates.when(
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stackTrace) => const Center(
        child: CircularProgressIndicator(),
      ),
      data: (data) {
        return ListView.builder(
          physics: const ClampingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          itemCount: data.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                data.elementAt(index).question.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 30,
                ),
              ),
              subtitle: Text(
                data.elementAt(index).selectedOption ?? 'None',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
