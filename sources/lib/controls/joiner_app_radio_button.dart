import 'package:flutter/material.dart';
import 'package:joiner_app_walkthrough/colors.dart';

class JoinerAppRadio<T> extends StatefulWidget {
  final T value;
  final T groupValue;
  final void Function(T)? onChanged;

  final double? size;
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

  Color? _defaultBackgroundColor;
  Color? _defaultUnselectedBackgroundColor;

  @override
  Widget build(BuildContext context) {
    Color? color = Theme.of(context)
        .radioTheme
        .fillColor
        ?.resolve(<MaterialState>{}..add(MaterialState.focused));

    color = color ?? JoinerAppColors.palePurple;
    _defaultBackgroundColor = _defaultBackgroundColor ?? color.withAlpha(76);
    _defaultUnselectedBackgroundColor =
        _defaultUnselectedBackgroundColor ?? color.withAlpha(51);

    bool selected = widget.value == widget.groupValue;

    return _getContainer(selected);
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
        size: widget.size,
        color: selected
            ? widget.selectedColor ?? _defaultSelectedRadioButton
            : widget.radioBackgroundColor ?? _defaultRadioButtonColor,
      ),
    );
  }
}
