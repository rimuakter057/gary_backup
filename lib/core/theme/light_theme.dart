import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gary_goodger/utils/app_colors/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.backgroundColor,
 // fontFamily: AppConfig.questrial,
  ///custom_appbar===============================================
  appBarTheme:  AppBarTheme(
    backgroundColor: AppColors.white,
    elevation: 0,
    centerTitle: true,

    iconTheme: IconThemeData(color: AppColors.black),
  ),
///elevated  button==============================================================
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor:AppColors.primary,
      minimumSize: const Size(double.infinity, 61), // full width, fixed height
      shadowColor: Colors.transparent,
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r)),
      foregroundColor: AppColors.white,

      textStyle: GoogleFonts.instrumentSans(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600
      ),
    ),
  ),

///outline button==========================================================
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      side: const BorderSide(color: AppColors.outlineBorder, width: 1),
      foregroundColor: AppColors.black,
      minimumSize: const Size(double.infinity, 61),
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r)),
      textStyle: GoogleFonts.inter(
        color: AppColors.black,
        fontSize: 18,
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
    fillColor: AppColors.textFieldBg,
    iconColor: AppColors.subPrimary,
    prefixIconColor: AppColors.subPrimary,
    // icon box size
    prefixIconConstraints: BoxConstraints(
      minWidth: 24.w,
      minHeight: 24.h,
    ),

    suffixIconColor: AppColors.subPrimary,
    contentPadding:  EdgeInsets.zero,
    isDense: true,

    labelStyle: GoogleFonts.instrumentSans(
      fontWeight: FontWeight.w500,
      fontSize: 16.sp,
      color: AppColors.subPrimary,
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
      borderSide: const BorderSide(color: AppColors.black),
    ),
    border:InputBorder.none,
    enabledBorder: InputBorder.none,
    focusedBorder: InputBorder.none,
    hintStyle:GoogleFonts.instrumentSans(
      fontWeight: FontWeight.w500,
      fontSize: 16.sp,
      color: AppColors.subPrimary,
    ),

    errorStyle: GoogleFonts.instrumentSans(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.errorColor,
    ),
  ),

///text theme=====================================================================
  textTheme: TextTheme(
    bodyLarge: GoogleFonts.instrumentSans(
      fontSize: 20.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.textBlack,
    ),

    bodyMedium: GoogleFonts.instrumentSans(
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.textBlack,
    ),

    bodySmall:GoogleFonts.instrumentSans(

      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.subPrimary,
    ),

    titleLarge:  GoogleFonts.instrumentSans(

      fontSize: 28,
      fontWeight: FontWeight.w700,
      color: AppColors.textBlack,
    ),

    titleMedium:  GoogleFonts.instrumentSans(
      fontSize: 17,
      fontWeight: FontWeight.w400,
      color: AppColors.subTitle,
    ),

    titleSmall:  GoogleFonts.instrumentSans(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.subTitle,
    ),
    labelMedium:   GoogleFonts.instrumentSans(
      fontWeight: FontWeight.w500,
      fontSize: 18.sp,
      color: AppColors.textBlack,
    ),
























  ),
);
