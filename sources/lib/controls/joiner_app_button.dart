import 'package:flutter/material.dart';

class JoinerAppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final double? fontSize;
  final FontWeight? fontWeight;

  const JoinerAppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.fontSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: fontWeight ?? FontWeight.w800,
          fontSize: fontSize ?? 18,
        ),
      ),
    );
  }
}
