import 'package:flutter/material.dart';
import 'package:gary_goodger/utils/app_colors/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.backgroundColor,
 // fontFamily: AppConfig.questrial,
  ///appbar===============================================
  appBarTheme:  AppBarTheme(
    backgroundColor: AppColors.backgroundColor,
    elevation: 0,
    centerTitle: true,

    iconTheme: IconThemeData(color: AppColors.black),
  ),
///elevated  button==============================================================
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor:AppColors.primary,
      minimumSize: const Size(double.infinity, 48), // full width, fixed height
      shadowColor: Colors.transparent,
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      foregroundColor: AppColors.white,

      textStyle: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w500
      ),
    ),
  ),

///outline button==========================================================
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      side: const BorderSide(color: AppColors.primary, width: 1.5),
      foregroundColor: AppColors.primary,
      minimumSize: const Size(186, 48),
      padding: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      textStyle: GoogleFonts.inter(

        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
  ///text button=================================================================
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.black,
      textStyle: const TextStyle(
       // fontFamily: AppConfig.questrial,
        fontWeight: FontWeight.w600,
        fontSize: 14,
        decoration: TextDecoration.underline,
      ),
    ),
  ),
  iconTheme: const IconThemeData(color: AppColors.black),
  /// input decoration-==================================================
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.backgroundColor,
    iconColor: AppColors.primary,
    prefixIconColor: AppColors.primary,
    suffixIconColor: AppColors.primary,
    contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: AppColors.subPrimary),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: AppColors.errorColor),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(width: 2, color: AppColors.errorColor),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.primary),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.primary),
    ),

    hintStyle:GoogleFonts.inter(

      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.black,
    ),

    errorStyle: GoogleFonts.inter(

      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.errorColor,
    ),
  ),

///text theme=====================================================================
  textTheme: TextTheme(


    titleLarge:  GoogleFonts.inter(

      fontSize: 32,
      fontWeight: FontWeight.w700,
      color: AppColors.black,
    ),

    titleMedium:GoogleFonts.playfairDisplay(

      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: AppColors.black,
    ),


    bodyMedium: GoogleFonts.inter(

      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.black,
    ),

    bodySmall:GoogleFonts.inter(

      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.black,
    ),

    labelMedium: GoogleFonts.inter(

      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColors.labelTextColor,
    ),

  ),
);
