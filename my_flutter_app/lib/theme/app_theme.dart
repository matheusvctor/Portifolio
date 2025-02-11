import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.transparent,
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFFE0E0E0),
        secondary: Color(0xFFBDBDBD),
        surface: Color(0xFF212121),
      ),
      cardTheme: CardTheme(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
          height: 1.2,
        ),
        headlineMedium: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.8,
          height: 1.3,
        ),
        titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
          height: 1.4,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          letterSpacing: 0.3,
          height: 1.6,
        ),
      ),
    );
  }

  static LinearGradient get subtleGradient {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Colors.white.withOpacity(0.05),
        Colors.white.withOpacity(0.02),
      ],
    );
  }

  static BoxDecoration get cardDecoration {
    return BoxDecoration(
      gradient: subtleGradient,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(
        color: Colors.white.withOpacity(0.1),
        width: 1,
      ),
    );
  }

  static Duration get defaultAnimationDuration {
    return const Duration(milliseconds: 300);
  }

  static BoxShadow get subtleShadow {
    return BoxShadow(
      color: Colors.white.withOpacity(0.03),
      blurRadius: 12,
      spreadRadius: -2,
    );
  }
}