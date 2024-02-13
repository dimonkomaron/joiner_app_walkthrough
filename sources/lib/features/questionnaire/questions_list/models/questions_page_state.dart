import 'package:flutter/foundation.dart';
import 'package:joiner_app_walkthrough/features/questionnaire/questions_list/models/question.dart';

@immutable
class QuestionsPageState {
  final Question question;
  final String? selectedOption;

  const QuestionsPageState({
    required this.question,
    required this.selectedOption,
  });

  QuestionsPageState copyWith({Question? question, String? selectedOption}) =>
      QuestionsPageState(
          question: question ?? this.question,
          selectedOption: selectedOption ?? this.selectedOption);
}
