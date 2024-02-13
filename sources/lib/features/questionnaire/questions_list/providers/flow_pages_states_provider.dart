import 'package:joiner_app_walkthrough/features/questionnaire/questions_list/models/questions_page_state.dart';
import 'package:joiner_app_walkthrough/features/questionnaire/questions_list/repository/questions_repository.dart';
import 'package:joiner_app_walkthrough/router/router.dart';
import 'package:joiner_app_walkthrough/router/routes.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'flow_pages_states_provider.g.dart';

@riverpod
class FlowPagesStates extends _$FlowPagesStates {
  List<QuestionsPageState>? _flowStates;

  @override
  FutureOr<List<QuestionsPageState>> build() async {
    if (_flowStates == null) {
      final questions =
          await ref.watch(questionRepositoryProvider).loadQuestions();
      _flowStates = _flowStates ??
          questions
              .map((e) => QuestionsPageState(question: e, selectedOption: null))
              .toList();
    }

    return _flowStates!;
  }

  void select(String item, int currentPage) {
    _flowStates![currentPage] =
        _flowStates![currentPage].copyWith(selectedOption: item);
  }

  Future<void> moveNext({required int fromPage}) async {
    var pagesStateProvider = await ref.read(flowPagesStatesProvider.future);

    if (fromPage == pagesStateProvider.length - 1) {
      ref.read(routerProvider).go(const ResultRoute().location);
      return;
    }

    ref.read(routerProvider).push(QuestionRoute(page: fromPage + 1).location);
  }

  void moveBack() => ref.read(routerProvider).pop();

  void skip() =>
      ref.read(routerProvider).go(const ResultRoute(skipped: true).location);
}
