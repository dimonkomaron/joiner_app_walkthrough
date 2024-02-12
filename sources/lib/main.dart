import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:joiner_app_walkthrough/app.dart';

void main() => runApp(
      const ProviderScope(
        child: JoinerApp(),
      ),
    );
