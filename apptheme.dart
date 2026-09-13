import 'package:flutter/material.dart';

class AppColors {
  // ============================================================
  // MAIN 3-COLOR PALETTE
  // ============================================================

  // Deep Navy / Charcoal
  static const Color primary = Color(0xFF111827);

  // Elegant Gold
  // static const Color accent = Color(0xFFD4A017);
  static const Color accentss = Color.fromARGB(255, 23, 212, 155);

  // Warm Off-White
  static const Color background = Color(0xFFF8F7F3);

  // Supporting colors
  static const Color white = Colors.white;
  static const Color grey = Color(0xFF6B7280);
  static const Color lightGrey = Color(0xFFE5E7EB);
}


class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,

    // ============================================================
    // COLORS
    // ============================================================

    scaffoldBackgroundColor: AppColors.background,

    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.accentss,
      surface: AppColors.white,

      onPrimary: AppColors.white,
      onSecondary: AppColors.primary,
      onSurface: AppColors.primary,
    ),

    // ============================================================
    // APP BAR
    // ============================================================

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.white,
      elevation: 0,
      centerTitle: false,
    ),

    // ============================================================
    // CARD
    // ============================================================

    cardTheme: const CardThemeData(
      color: AppColors.white,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(18),
        ),
      ),
    ),

    // ============================================================
    // INPUT FIELDS
    // ============================================================

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.white,

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(
          color: AppColors.lightGrey,
        ),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(
          color: AppColors.lightGrey,
        ),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(
          color: AppColors.accentss,
          width: 1.5,
        ),
      ),

      labelStyle: const TextStyle(
        color: AppColors.grey,
      ),

      hintStyle: const TextStyle(
        color: AppColors.grey,
      ),
    ),

    // ============================================================
    // ELEVATED BUTTON
    // ============================================================

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.accentss,
        foregroundColor: AppColors.primary,

        elevation: 0,

        minimumSize: const Size(
          double.infinity,
          52,
        ),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),

        textStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),

    // ============================================================
    // OUTLINED BUTTON
    // ============================================================

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primary,

        side: const BorderSide(
          color: AppColors.primary,
          width: 1.2,
        ),

        minimumSize: const Size(
          double.infinity,
          52,
        ),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    ),

    // ============================================================
    // TEXT THEME
    // ============================================================

    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: AppColors.primary,
        fontWeight: FontWeight.bold,
      ),

      headlineMedium: TextStyle(
        color: AppColors.primary,
        fontWeight: FontWeight.bold,
      ),

      titleLarge: TextStyle(
        color: AppColors.primary,
        fontWeight: FontWeight.bold,
      ),

      titleMedium: TextStyle(
        color: AppColors.primary,
        fontWeight: FontWeight.w600,
      ),

      bodyLarge: TextStyle(
        color: AppColors.primary,
      ),

      bodyMedium: TextStyle(
        color: AppColors.grey,
      ),

      bodySmall: TextStyle(
        color: AppColors.grey,
      ),
    ),

    // ============================================================
    // BOTTOM NAVIGATION BAR
    // ============================================================

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.white,

      selectedItemColor: AppColors.accentss,

      unselectedItemColor: AppColors.grey,

      type: BottomNavigationBarType.fixed,

      elevation: 10,
    ),

    // ============================================================
    // DIVIDER
    // ============================================================

    dividerTheme: const DividerThemeData(
      color: AppColors.lightGrey,
      thickness: 1,
    ),

    // ============================================================
    // CHIP
    // ============================================================

    chipTheme: ChipThemeData(
      backgroundColor: AppColors.white,

      selectedColor: AppColors.accentss,

      side: const BorderSide(
        color: AppColors.lightGrey,
      ),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),

      labelStyle: const TextStyle(
        color: AppColors.primary,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}