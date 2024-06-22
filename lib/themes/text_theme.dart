import 'package:flutter/material.dart';

class AppTextTheme {
  AppTextTheme._();

  static TextTheme textTheme = TextTheme(
    // Title Themes
    titleLarge:
        const TextStyle().copyWith(fontSize: 36, fontWeight: FontWeight.bold),
    titleMedium:
        const TextStyle().copyWith(fontSize: 30, fontWeight: FontWeight.bold),
    titleSmall:
        const TextStyle().copyWith(fontSize: 26, fontWeight: FontWeight.bold),

    // Heading Themes
    headlineLarge:
        const TextStyle().copyWith(fontSize: 24, fontWeight: FontWeight.bold),
    headlineMedium:
        const TextStyle().copyWith(fontSize: 22, fontWeight: FontWeight.bold),
    headlineSmall:
        const TextStyle().copyWith(fontSize: 20, fontWeight: FontWeight.bold),

    bodyLarge: const TextStyle().copyWith(fontSize: 18),
    bodyMedium: const TextStyle().copyWith(fontSize: 16),
    bodySmall: const TextStyle().copyWith(fontSize: 14),
  );
}
