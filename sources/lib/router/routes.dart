import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:joiner_app_walkthrough/features/home/widgets/home_page.dart';
import 'package:joiner_app_walkthrough/features/questionnaire/questions_list/questions_page.dart';
import 'package:joiner_app_walkthrough/features/questionnaire/result/widgets/result_page.dart'; //at the top

part 'routes.g.dart';

@TypedGoRoute<HomeRoute>(
  path: '/home',
  routes: [
    TypedGoRoute<IntroductionRoute>(
      path: 'intro',
      routes: [
        TypedGoRoute<QuestionRoute>(path: 'questions'),
      ],
    ),
    TypedGoRoute<ResultRoute>(path: 'result'),
  ],
)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}

class IntroductionRoute extends GoRouteData {
  const IntroductionRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const QuestionsPage(page: 0);
  }
}

class QuestionRoute extends GoRouteData {
  final int page;
  const QuestionRoute({
    required this.page,
  });

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return QuestionsPage(page: page);
  }

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    if (Platform.isAndroid) {
      return CustomTransitionPage(
        child: QuestionsPage(page: page),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.ease;
          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      );
    } else {
      return super.buildPage(context, state);
    }
  }
}

class ResultRoute extends GoRouteData {
  final bool skipped;
  const ResultRoute({this.skipped = false});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ResultPage(skipped: skipped);
  }
}
