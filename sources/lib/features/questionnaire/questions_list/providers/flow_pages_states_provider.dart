import 'package:joiner_app_walkthrough/features/questionnaire/questions_list/models/flow_page_state.dart';
import 'package:joiner_app_walkthrough/features/questionnaire/questions_list/repository/questions_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'flow_pages_states_provider.g.dart';

@riverpod
class FlowPagesStates extends _$FlowPagesStates {
  List<FlowPageState>? _flowStates;

  @override
  FutureOr<List<FlowPageState>> build() async {
    if (_flowStates == null) {
      final questions =
          await ref.watch(questionRepositoryProvider).loadQuestions();
      _flowStates = _flowStates ??
          questions
              .map((e) => FlowPageState(question: e, selectedOption: null))
              .toList();
    }

    return _flowStates!;
  }

  void select(String item, int currentPage) {
    _flowStates![currentPage] =
        _flowStates![currentPage].copyWith(selectedOption: item);
  }
}
