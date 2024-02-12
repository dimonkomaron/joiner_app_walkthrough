import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:joiner_app_walkthrough/colors.dart';
import 'package:joiner_app_walkthrough/router/router.dart';

class JoinerApp extends ConsumerWidget {
  const JoinerApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      routerConfig: router,
      theme: _getJoinerAppLightTheme(),
    );
  }

  ThemeData _getJoinerAppLightTheme() {
    return ThemeData(
      useMaterial3: true,
      textTheme: GoogleFonts.darkerGrotesqueTextTheme(),
      colorScheme: const ColorScheme.light(
        secondary: JoinerAppColors.purple,
        primary: JoinerAppColors.orange,
      ),
    );
  }
}
