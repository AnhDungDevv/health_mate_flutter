import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Add this import

final textTheme = TextTheme(
  displayLarge: GoogleFonts.outfit(
    fontWeight: FontWeight.w400,
    fontSize: 57.sp,
    height: 64 / 57,
    letterSpacing: -0.25,
  ),
  displayMedium: GoogleFonts.outfit(
    fontWeight: FontWeight.w400,
    fontSize: 45.sp,
    height: 52 / 45,
  ),
  displaySmall: GoogleFonts.outfit(
    fontWeight: FontWeight.w400,
    fontSize: 36.sp,
    height: 44 / 36,
  ),
  headlineLarge: GoogleFonts.outfit(
    fontWeight: FontWeight.w400,
    fontSize: 32.sp,
    height: 40 / 32,
  ),
  headlineMedium: GoogleFonts.outfit(
    fontWeight: FontWeight.w400,
    fontSize: 28.sp,
    height: 36 / 28,
  ),
  headlineSmall: GoogleFonts.outfit(
    fontWeight: FontWeight.w400,
    fontSize: 24.sp,
    height: 32 / 24,
  ),
  titleLarge: GoogleFonts.outfit(
    fontWeight: FontWeight.w700,
    fontSize: 22.sp,
    height: 28 / 22,
  ),
  titleMedium: GoogleFonts.outfit(
    fontWeight: FontWeight.w600,
    fontSize: 16.sp,
    height: 24 / 16,
    letterSpacing: 0.1,
  ),
  titleSmall: GoogleFonts.outfit(
    fontWeight: FontWeight.w600,
    fontSize: 14.sp,
    height: 20 / 14,
    letterSpacing: 0.1,
  ),
  labelLarge: GoogleFonts.outfit(
    fontWeight: FontWeight.w700,
    fontSize: 14.sp,
    height: 20 / 14,
  ),
  labelMedium: GoogleFonts.outfit(
    fontWeight: FontWeight.w700,
    fontSize: 12.sp,
    height: 16 / 12,
  ),
  labelSmall: GoogleFonts.outfit(
    fontWeight: FontWeight.w700,
    fontSize: 11.sp,
    height: 16 / 11,
  ),
  bodyLarge: GoogleFonts.outfit(
    fontWeight: FontWeight.w400,
    fontSize: 16.sp,
    height: 24 / 16,
  ),
  bodyMedium: GoogleFonts.outfit(
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
    height: 20 / 14,
  ),
  bodySmall: GoogleFonts.outfit(
    fontWeight: FontWeight.w400,
    fontSize: 12.sp,
    height: 16 / 12,
  ),
);
