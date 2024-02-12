import 'package:joiner_app_walkthrough/features/questionnaire/questions_list/providers/flow_pages_states_provider.dart';
import 'package:joiner_app_walkthrough/router/router.dart';
import 'package:joiner_app_walkthrough/router/routes.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'flow_navigation_manager.g.dart';

@riverpod
class CurrentNavigationPageManager extends _$CurrentNavigationPageManager {
  @override
  void build() {}

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
