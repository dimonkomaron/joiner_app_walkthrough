import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:joiner_app_walkthrough/controls/joiner_app_radio_list_tile.dart';
import 'package:joiner_app_walkthrough/features/questionnaire/questions_list/models/questions_page_state.dart';
import 'package:joiner_app_walkthrough/features/questionnaire/questions_list/providers/questions_page_state_controller_provider.dart';

class QuestionListWidget extends ConsumerWidget {
  final Function(String item)? onSelect;
  final int page;

  const QuestionListWidget({
    super.key,
    required this.page,
    this.onSelect,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var modelAsync = ref.watch(questionsPageStateControllerProvider(page));
    return modelAsync.when(
      error: (e, st) => Container(color: Colors.transparent),
      loading: () => Container(color: Colors.transparent),
      data: (model) => _getQuestionnaireListView(context, model),
    );
  }

  Widget _getQuestionnaireListView(
      BuildContext context, QuestionsPageState model) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            model.question.title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 32,
            ),
          ),
        ),
        Expanded(
          child: ListView.separated(
            physics: const ClampingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            itemCount: model.question.options.length,
            itemBuilder: (context, index) {
              final listTileScheme = Theme.of(context).listTileTheme;

              final isSelected =
                  model.question.options[index] == model.selectedOption;

              return JoinerAppRadioListTile<String?>(
                value: model.question.options.elementAt(index),
                groupValue: model.selectedOption,
                onChanged: (value) =>
                    onSelect?.call(model.question.options[index]),
                title: Text(
                  model.question.options[index],
                  style: TextStyle(
                    fontSize: isSelected ? 18 : 16,
                    fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
                    color: isSelected
                        ? listTileScheme.selectedColor
                        : listTileScheme.textColor,
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              final dividerTheme = Theme.of(context).dividerTheme;
              return Divider(
                height: dividerTheme.thickness,
                color: dividerTheme.color,
              );
            },
          ),
        ),
      ],
    );
  }
}
