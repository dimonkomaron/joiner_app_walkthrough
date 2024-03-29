import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:joiner_app_walkthrough/controls/joiner_app_button.dart';
import 'package:joiner_app_walkthrough/controls/joiner_app_container.dart';
import 'package:joiner_app_walkthrough/features/questionnaire/questions_list/providers/questions_page_state_controller_provider.dart';
import 'package:joiner_app_walkthrough/features/questionnaire/questions_list/providers/flow_pages_states_provider.dart';
import 'package:joiner_app_walkthrough/features/questionnaire/questions_list/widgets/questionnaire_app_bar.dart';
import 'package:joiner_app_walkthrough/features/questionnaire/questions_list/widgets/questionnaire_list.dart';

class QuestionsPage extends ConsumerWidget {
  final int page;

  const QuestionsPage({
    super.key,
    required this.page,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: QuestionnaireAppBar(
        back: () => ref.read(flowPagesStatesProvider.notifier).moveBack(),
        skip: () => ref.read(flowPagesStatesProvider.notifier).skip(),
      ),
      body: JoinerAppContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: QuestionListWidget(
                page: page,
                onSelect: (item) {
                  ref
                      .read(questionsPageStateControllerProvider(page).notifier)
                      .select(item);
                },
              ),
            ),
            _BottomNextActionBar(currentPage: page),
          ],
        ),
      ),
    );
  }
}

class _BottomNextActionBar extends ConsumerWidget {
  final int currentPage;

  const _BottomNextActionBar({
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var pagesStateProvider = ref.watch(flowPagesStatesProvider);
    var flowPagesStateController =
        ref.watch(questionsPageStateControllerProvider(currentPage));
    return SafeArea(
      bottom: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 23.0,
          vertical: 10,
        ),
        child: JoinerAppButton(
          onPressed: flowPagesStateController.when(
            loading: () => null,
            error: (error, stackTrace) => null,
            data: (data) => data.selectedOption == null
                ? null
                : () async => await onNextPressed(ref),
          ),
          text: pagesStateProvider.when(
            data: (data) => currentPage == data.length - 1 ? 'Done' : 'Next',
            error: (e, st) => 'Next',
            loading: () => 'Next',
          ),
          fontSize: 25,
        ),
      ),
    );
  }

  Future<void> onNextPressed(WidgetRef ref) async {
    final pagesStatesProvider = ref.read(flowPagesStatesProvider);

    if (!pagesStatesProvider.hasValue) {
      return;
    }

    if (pagesStatesProvider.value!.elementAt(currentPage).selectedOption ==
        null) {
      return;
    }

    await ref
        .read(flowPagesStatesProvider.notifier)
        .moveNext(fromPage: currentPage);
  }
}
