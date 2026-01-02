import 'package:flutter/material.dart';

class AppTheme {
  static const Color _primarySeed = Color(0xFFB170F4);
  static const Color _secondarySeed = Color(0xFF8BC34A);

  static final ColorScheme _lightColorScheme = ColorScheme.fromSeed(
    seedColor: _primarySeed,
    brightness: Brightness.light,
    secondary: _secondarySeed,
  );

  static final ColorScheme _darkColorScheme = ColorScheme.fromSeed(
    seedColor: _primarySeed,
    brightness: Brightness.dark,
    secondary: _secondarySeed,
  );

  static ThemeData get lightTheme {
    return ThemeData(useMaterial3: true, colorScheme: _lightColorScheme);
  }

  static ThemeData get darkTheme {
    return ThemeData(useMaterial3: true, colorScheme: _darkColorScheme);
  }

  static ColorScheme get lightColors => _lightColorScheme;
  static ColorScheme get darkColors => _darkColorScheme;

  static ThemeData createTheme({
    required Color primarySeed,
    Color? secondarySeed,
    Brightness brightness = Brightness.light,
  }) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: primarySeed,
      brightness: brightness,
      secondary: secondarySeed,
    );

    return ThemeData(useMaterial3: true, colorScheme: colorScheme);
  }
}
