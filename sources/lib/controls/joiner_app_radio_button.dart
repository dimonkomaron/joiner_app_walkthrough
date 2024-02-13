import 'package:flutter/material.dart';
import 'package:joiner_app_walkthrough/colors.dart';

class JoinerAppRadio<T> extends StatefulWidget {
  final T value;
  final T groupValue;
  final void Function(T)? onChanged;

  final int? size;
  final Color? radioBackgroundColor;
  final Color? selectedColor;
  final Color? selectedBackgroundColor;
  final Color? borderColor;
  final double? borderWidth;

  const JoinerAppRadio({
    super.key,
    required this.value,
    required this.groupValue,
    this.onChanged,
    this.size,
    this.radioBackgroundColor,
    this.selectedColor,
    this.selectedBackgroundColor,
    this.borderColor,
    this.borderWidth,
  });

  @override
  JoinerAppRadioState createState() => JoinerAppRadioState();
}

class JoinerAppRadioState extends State<JoinerAppRadio> {
  static const Color _defaultBorderColor = Colors.white;
  static const Color _defaultRadioButtonColor = Colors.transparent;
  static const Color _defaultSelectedRadioButton = Colors.white;

  final Color _defaultBackgroundColor =
      JoinerAppColors.palePurple.withAlpha(76);
  final Color _defaultUnselectedBackgroundColor =
      JoinerAppColors.palePurple.withAlpha(51);

  @override
  Widget build(BuildContext context) {
    bool selected = widget.value == widget.groupValue;
    final radioButtonContainer = _getContainer(selected);
    return radioButtonContainer;
  }

  Widget _getContainer(bool selected) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(
          width: widget.borderWidth ?? 2,
          color: widget.borderColor ?? _defaultBorderColor,
        ),
        shape: BoxShape.circle,
        color: selected
            ? widget.selectedBackgroundColor ?? _defaultBackgroundColor
            : widget.radioBackgroundColor ?? _defaultUnselectedBackgroundColor,
      ),
      child: Icon(
        Icons.circle,
        size: 20,
        color: selected
            ? widget.selectedColor ?? _defaultSelectedRadioButton
            : widget.radioBackgroundColor ?? _defaultRadioButtonColor,
      ),
    );
  }
}
