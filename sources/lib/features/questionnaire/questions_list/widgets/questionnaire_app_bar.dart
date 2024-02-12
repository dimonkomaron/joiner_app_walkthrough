import 'package:flutter/material.dart';
import 'package:joiner_app_walkthrough/colors.dart';

class QuestionnaireAppBar extends AppBar {
  QuestionnaireAppBar({
    super.key,
    VoidCallback? back,
    VoidCallback? skip,
  }) : super(
          backgroundColor: JoinerAppColors.purple,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
            onPressed: back,
          ),
          actions: [
            TextButton(
              onPressed: skip,
              child: const Text(
                'Skip for now',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: JoinerAppColors.orange,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        );
}
