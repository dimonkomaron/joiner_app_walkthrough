import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:joiner_app_walkthrough/colors.dart';
import 'package:joiner_app_walkthrough/controls/joiner_app_radio_button.dart';
import 'package:joiner_app_walkthrough/features/questionnaire/questions_list/providers/flow_page_state_controller_provider.dart';

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
    var modelAsync = ref.watch(flowPagesStateControllerProvider(page));
    return modelAsync.when(
      error: (e, st) => Container(color: Colors.transparent),
      loading: () => Container(color: Colors.transparent),
      data: (model) {
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
                  final isSelected =
                      model.question.options[index] == model.selectedOption;
                  return ListTile(
                    onTap: () => onSelect?.call(model.question.options[index]),
                    tileColor: Colors.transparent,
                    title: Text(
                      model.question.options[index],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight:
                            isSelected ? FontWeight.w800 : FontWeight.w600,
                        color: isSelected
                            ? Colors.white
                            : JoinerAppColors.palePurple,
                      ),
                    ),
                    selected: isSelected,
                    trailing: CustomRadio(
                      selectedColor: Colors.white,
                      radioBackgroundColor: Color.fromARGB(
                        76,
                        JoinerAppColors.palePurple.red,
                        JoinerAppColors.palePurple.green,
                        JoinerAppColors.palePurple.blue,
                      ),
                      selectedBackgroundColor: Color.fromARGB(
                        51,
                        JoinerAppColors.palePurple.red,
                        JoinerAppColors.palePurple.green,
                        JoinerAppColors.palePurple.blue,
                      ),
                      borderColor:
                          isSelected ? Colors.white : const Color(0x4DFFFFFF),
                      borderWidth: 2,
                      value: model.question.options.elementAt(index),
                      groupValue: model.selectedOption,
                      onChanged: (value) =>
                          onSelect?.call(model.question.options[index]),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    height: 1,
                    color: JoinerAppColors.palePurple,
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}