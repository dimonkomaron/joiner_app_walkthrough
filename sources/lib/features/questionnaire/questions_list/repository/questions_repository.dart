import 'package:joiner_app_walkthrough/features/questionnaire/questions_list/models/question.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'questions_repository.g.dart';

@riverpod
QuestionRepository questionRepository(QuestionRepositoryRef ref) {
  return QuestionRepository();
}

class QuestionRepository {
  Future<List<Question>> loadQuestions() async {
    return [
      Question(
        title: 'What\'s your professional area?',
        options: [
          'Doctor',
          'Teacher',
          'Programmer/Developer',
          'Lawyer',
          'Chef',
          'Journalist',
          'Accountant',
          'Driver',
          'Select later',
        ],
      ),
      Question(
        title: 'What\'s your hobby?',
        options: [
          'Sport',
          'Games',
          'Board Games',
          'Hiking',
          'Traveling',
          'Select later',
        ],
      ),
      Question(
        title: 'What\'s your favorite cuisine?',
        options: [
          'Italian',
          'French',
          'American',
          'Middle-Eastern',
          'East European',
          'Mexican',
          'Chinese',
          'Select later',
        ],
      ),
    ];
  }
}
