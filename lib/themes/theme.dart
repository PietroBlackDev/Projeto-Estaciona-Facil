import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData myTheme = ThemeData(
  useMaterial3: true,
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xffFFFFFF),
    onPrimary: Color(0xff540F63),
    error: Colors.red,
    onError: Colors.white,
    surface: Color(0xFFF4F4F4),
    onSurface: Color.fromARGB(255, 42, 42, 42),
    secondary: Color(0xff540F63),
    onSecondary: Colors.white,
  ),
  textTheme: TextTheme(
    titleLarge: TextStyle(
      fontSize: 26,
      color: Color(0xff540F63),
      fontWeight: FontWeight.bold,
      fontFamily: GoogleFonts.ubuntu().fontFamily,
    ),
    titleMedium: TextStyle(
      fontSize: 20,
      color: Color.fromARGB(255, 42, 42, 42),
      fontWeight: FontWeight.bold,
      fontFamily: GoogleFonts.ubuntu().fontFamily,
    ),
    bodyMedium: TextStyle(
      color: Color.fromARGB(255, 42, 42, 42),
      fontSize: 18,
      fontWeight: FontWeight.w500,
      fontFamily: GoogleFonts.ubuntu().fontFamily,
    ),
    bodySmall: TextStyle(
      fontSize: 14,
      fontFamily: GoogleFonts.ubuntu().fontFamily,
    ),
  ),
  iconTheme: const IconThemeData(color: Colors.white, size: 40),
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      iconColor: WidgetStatePropertyAll(Color(0xff540F63)),
      iconSize: WidgetStatePropertyAll(30),
      padding: WidgetStatePropertyAll<EdgeInsetsGeometry>(
        EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      ),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: const Color.fromARGB(255, 255, 255, 255),
      backgroundColor: Color(0xff540F63),
      textStyle: TextStyle(
        fontWeight: FontWeight.bold, // isso já define como negrito
        fontSize: 23,
        fontFamily: GoogleFonts.ubuntu().fontFamily,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    ),
  ),
);
