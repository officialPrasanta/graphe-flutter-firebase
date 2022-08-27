import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphe_firebase_notification/constants/colors.dart';
import 'package:graphe_firebase_notification/theme/material_colors.dart';

ThemeData themeData = ThemeData(
  scaffoldBackgroundColor: kScaffolBackgroundColor,
  primarySwatch: kPrimaryMaterialColor,
  textTheme: TextTheme(
    titleLarge: GoogleFonts.openSans(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      height: 1.2,
      color: kTextColor,
    ),
    titleMedium: GoogleFonts.openSans(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      height: 1.2,
      color: kLabelColor,
    ),
    titleSmall: GoogleFonts.openSans(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      height: 1.2,
      color: kOnPrimaryTextColor,
    ),
    bodyMedium: GoogleFonts.openSans(
      fontSize: 14,
      height: 1.2,
      color: kTextColor,
    ),
    bodySmall: GoogleFonts.openSans(
      fontSize: 12,
      color: kTextColor,
    ),
    labelSmall: GoogleFonts.openSans(
      fontSize: 14,
      color: kLabelColor,
    ),
    headlineSmall: GoogleFonts.openSans(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: kTextColor,
    ),
  ),
);
