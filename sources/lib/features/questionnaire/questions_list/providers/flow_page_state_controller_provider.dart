import 'package:joiner_app_walkthrough/features/questionnaire/questions_list/models/flow_page_state.dart';
import 'package:joiner_app_walkthrough/features/questionnaire/questions_list/providers/flow_pages_states_provider.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'flow_page_state_controller_provider.g.dart';

@riverpod
class FlowPagesStateController extends _$FlowPagesStateController {
  @override
  FutureOr<FlowPageState> build(int currentPage) async {
    var states = await ref.watch(flowPagesStatesProvider.future);

    return states[currentPage];
  }

  void select(String item) async {
    ref.read(flowPagesStatesProvider.notifier).select(item, currentPage);

    state = ref
        .read(flowPagesStatesProvider)
        .whenData((value) => value.elementAt(currentPage));
  }
}
