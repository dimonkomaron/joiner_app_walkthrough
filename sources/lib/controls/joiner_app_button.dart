import 'package:flutter/material.dart';
import 'package:joiner_app_walkthrough/colors.dart';

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
      style: onPressed == null
          ? const ButtonStyle()
          : ButtonStyle(
              backgroundColor: MaterialStateColor.resolveWith(
                (states) => JoinerAppColors.orange,
              ),
            ),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: fontWeight ?? FontWeight.w800,
          fontSize: fontSize ?? 18,
          color: JoinerAppColors.purple,
        ),
      ),
    );
  }
}
