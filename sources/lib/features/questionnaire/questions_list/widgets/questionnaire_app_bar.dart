import 'package:flutter/material.dart';

class QuestionnaireAppBar extends AppBar {
  QuestionnaireAppBar({
    super.key,
    VoidCallback? back,
    VoidCallback? skip,
  }) : super(
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
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        );
}
