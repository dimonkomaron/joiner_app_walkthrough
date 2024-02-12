import 'package:joiner_app_walkthrough/router/router.dart';
import 'package:joiner_app_walkthrough/router/routes.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_provider.g.dart';

@riverpod
class Home extends _$Home {
  @override
  void build() {}

  Future<void> openQuestionnaire() async {
    ref.read(routerProvider).go(const IntroductionRoute().location);
  }
}
