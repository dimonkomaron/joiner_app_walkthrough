import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:joiner_app_walkthrough/colors.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.darkerGrotesqueTextTheme(),
        colorScheme: const ColorScheme.light(
          primary: JoinerAppColors.orange,
          onPrimary: JoinerAppColors.purple,
          secondary: JoinerAppColors.purple,
          onSecondary: Colors.white,
        ),
        listTileTheme: const ListTileThemeData(
          textColor: JoinerAppColors.palePurple,
          selectedColor: Colors.white,
        ),
        dividerTheme: const DividerThemeData(
          color: JoinerAppColors.palePurple,
          thickness: 1,
        ),
        // dividerColor: JoinerAppColors.palePurple,
        appBarTheme: const AppBarTheme(
          backgroundColor: JoinerAppColors.purple,
        ),
      );

  static ThemeData get darkTheme => ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.darkerGrotesqueTextTheme(),
        colorScheme: const ColorScheme.dark(
          primary: Color.fromARGB(255, 83, 2, 134),
          onPrimary: Colors.white,
          primaryContainer: Color(0xFFF2AE3F),
          secondary: Color.fromARGB(255, 30, 6, 58),
          onSecondary: Colors.white,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 30, 6, 58),
        ),
        dividerTheme: const DividerThemeData(
          color: Colors.blueGrey,
          thickness: 1,
        ),
      );
}
