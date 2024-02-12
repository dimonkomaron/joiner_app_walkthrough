import 'package:flutter/foundation.dart';
import 'package:joiner_app_walkthrough/features/questionnaire/questions_list/models/question.dart';

@immutable
class FlowPageState {
  final Question question;
  final String? selectedOption;

  const FlowPageState({
    required this.question,
    required this.selectedOption,
  });

  FlowPageState copyWith({Question? question, String? selectedOption}) =>
      FlowPageState(
          question: question ?? this.question,
          selectedOption: selectedOption ?? this.selectedOption);
}
