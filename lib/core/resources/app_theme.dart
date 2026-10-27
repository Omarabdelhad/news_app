import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

abstract class AppTheme {
  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarThemeData(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.lightPrimaryColor
      )
    ),
    textTheme: TextTheme(
        headlineMedium: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.lightPrimaryColor
      ),
      titleMedium: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.lightSecondaryColor
      ),
      titleSmall: TextStyle(
        color: AppColors.greyColor,
        fontSize:12.sp,
        fontWeight: FontWeight.w500
      )
    ),
    tabBarTheme: TabBarThemeData(
      dividerHeight: 0,
      labelStyle: TextStyle(
        color: AppColors.lightPrimaryColor,
        fontWeight: FontWeight.w700,
        fontSize: 16.sp
      ) ,
      unselectedLabelStyle: TextStyle(
          color: AppColors.lightPrimaryColor,
          fontWeight: FontWeight.w500,
          fontSize: 14.sp
      ),
      tabAlignment: TabAlignment.start,
      labelPadding: REdgeInsets.only(right: 16),
    ),
    colorScheme: ColorScheme.light(
      primary: AppColors.lightPrimaryColor,
      secondary: AppColors.lightSecondaryColor,
      tertiary: AppColors.greyColor,
      onPrimaryContainer: Colors.white.withValues(alpha: 0.5)
    )
  );
}