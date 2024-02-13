import 'package:flutter/material.dart';
import 'package:joiner_app_walkthrough/controls/joiner_app_radio_button.dart';

class JoinerAppRadioListTile<T> extends StatelessWidget {
  final Widget? leading;
  final Widget? title;
  final Color? tileColor;

  final T value;
  final T groupValue;
  final void Function(T) onChanged;

  const JoinerAppRadioListTile({
    super.key,
    this.leading,
    this.title,
    this.tileColor,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    bool isSelected = value == groupValue;
    return ListTile(
      title: title,
      leading: leading,
      tileColor: tileColor,
      onTap: () => onChanged.call(groupValue),
      trailing: JoinerAppRadio<T>(
        value: value,
        groupValue: groupValue,
        borderColor: isSelected ? Colors.white : const Color(0x4DFFFFFF),
        selectedColor: Colors.white,
        borderWidth: 2,
      ),
    );
  }
}
