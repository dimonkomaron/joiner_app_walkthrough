import 'package:flutter/material.dart';
import 'package:joiner_app_walkthrough/features/questionnaire/questions_list/models/question.dart';
import 'package:joiner_app_walkthrough/features/questionnaire/questions_list/widgets/questionnaire_list.dart';

// TODO: implement to allow multiple types
class QuestionnaireWidgetFactory {
  Widget getQuestionnaireViewForQuestion(
    dynamic question,
    int page,
    Function(dynamic) onSelect,
  ) {
    if (question is Question) {
      return QuestionListWidget(
        page: page,
        onSelect: onSelect,
      );
    }

    return const SizedBox();
  }
}
