import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'routes/app_routes.dart';
import 'screens/splash_screen.dart';

class OsitoVicunaApp extends StatelessWidget {
  const OsitoVicunaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Osito Vicuña',
      debugShowCheckedModeBanner: false,
      theme: _buildTheme(),
      initialRoute: AppRoutes.splash,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }

  ThemeData _buildTheme() {
    // Paleta creepy-cute de Osito Vicuña
    const colorMarron = Color(0xFF6B4F3A);
    const colorRojo = Color(0xFFB33A3A);
    const colorCrema = Color(0xFFF2E6D8);
    const colorTurquesa = Color(0xFF4FB3A6);

    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: colorMarron,
        primary: colorMarron,
        secondary: colorRojo,
        tertiary: colorTurquesa,
        surface: colorCrema,
        background: colorCrema,
      ),
      scaffoldBackgroundColor: colorCrema,
      textTheme: GoogleFonts.nunitoTextTheme().copyWith(
        displayLarge: GoogleFonts.nunito(
          fontSize: 32,
          fontWeight: FontWeight.w800,
          color: colorMarron,
        ),
        titleLarge: GoogleFonts.nunito(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: colorMarron,
        ),
        bodyMedium: GoogleFonts.nunito(
          fontSize: 15,
          color: colorMarron,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorMarron,
          foregroundColor: colorCrema,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
          textStyle: GoogleFonts.nunito(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
          elevation: 4,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: colorMarron,
        foregroundColor: colorCrema,
        elevation: 2,
        titleTextStyle: GoogleFonts.nunito(
          fontSize: 20,
          fontWeight: FontWeight.w800,
          color: colorCrema,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: colorMarron,
        selectedItemColor: colorCrema,
        unselectedItemColor: Color(0xFFB89A84),
      ),
      cardTheme: CardTheme(
        color: Colors.white,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: colorRojo,
        contentTextStyle: GoogleFonts.nunito(
          color: colorCrema,
          fontWeight: FontWeight.w600,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
