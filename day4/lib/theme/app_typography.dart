import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTypography {
  static TextStyle calorieLeftTitle = GoogleFonts.plusJakartaSans(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.calorieDarkText,
  );

  static TextStyle calorieLeftValue = GoogleFonts.plusJakartaSans(
    fontSize: 44,
    fontWeight: FontWeight.w800,
    letterSpacing: -2,
    height: 0.9,
    color: AppColors.calorieDarkText,
  );

  static TextStyle calorieLeftUnit = GoogleFonts.plusJakartaSans(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.calorieMutedText,
  );

  // Food Item Card styles
  static TextStyle foodCardTitle = GoogleFonts.plusJakartaSans(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.foodCardDarkText,
  );

  static TextStyle foodCardMetricValue = GoogleFonts.plusJakartaSans(
    fontSize: 18,
    fontWeight: FontWeight.w800,
    color: AppColors.foodCardDarkText,
  );

  static TextStyle foodCardMetricLabel = GoogleFonts.plusJakartaSans(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.foodCardLabelText,
  );

  // Calorie Count Bar style
  static TextStyle ctaText = GoogleFonts.plusJakartaSans(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.4,
    color: AppColors.ctaText,
  );
}
