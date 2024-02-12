import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:joiner_app_walkthrough/router/routes.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

@riverpod
class Router extends _$Router {
  @override
  GoRouter build() {
    final router = GoRouter(
      navigatorKey: rootNavigatorKey,
      initialLocation: const HomeRoute().location,
      routes: $appRoutes,
    );

    ref.onDispose(router.dispose);

    return router;
  }
}
