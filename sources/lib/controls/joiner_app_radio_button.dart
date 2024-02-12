import 'package:flutter/material.dart';

class CustomRadio<T> extends StatefulWidget {
  final T value;
  final T groupValue;
  final void Function(T) onChanged;

  final int? size;
  final Color? radioBackgroundColor;
  final Color? selectedColor;
  final Color? selectedBackgroundColor;
  final Color? borderColor;
  final double? borderWidth;

  const CustomRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.size,
    this.radioBackgroundColor,
    this.selectedColor,
    this.selectedBackgroundColor,
    this.borderColor,
    this.borderWidth,
  });

  @override
  CustomRadioState createState() => CustomRadioState();
}

class CustomRadioState extends State<CustomRadio> {
  static const Color _defaultBorderColor = Colors.white;
  static const Color _defaultBackgroundColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    bool selected = widget.value == widget.groupValue;

    return InkWell(
      onTap: () {
        widget.onChanged(widget.value);
      },
      child: Container(
        padding: const EdgeInsets.all(
          4,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            width: widget.borderWidth ?? 0,
            color: widget.borderColor ?? _defaultBorderColor,
          ),
          shape: BoxShape.circle,
          color: selected
              ? widget.selectedBackgroundColor ?? _defaultBackgroundColor
              : widget.radioBackgroundColor ?? Colors.grey[200],
        ),
        child: Icon(
          Icons.circle,
          size: 20,
          color: selected
              ? widget.selectedColor ?? Colors.deepPurple
              : Colors.transparent,
        ),
      ),
    );
  }
}
