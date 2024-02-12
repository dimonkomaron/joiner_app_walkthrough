import 'package:flutter/material.dart';
import 'package:joiner_app_walkthrough/colors.dart';

class JoinerAppContainer extends StatelessWidget {
  final Widget child;

  const JoinerAppContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.bottomCenter,
          radius: 1.2,
          colors: [
            JoinerAppColors.redOrange,
            JoinerAppColors.purple,
          ],
        ),
      ),
      child: child,
    );
  }
}
