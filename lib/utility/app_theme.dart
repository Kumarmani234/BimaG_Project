// ignore_for_file: deprecated_member_use

import 'package:bima_g/utility/colors.dart';
import 'package:bima_g/utility/ts.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get appTheme {
    return ThemeData(
      primaryColor: AppColors.primaryColor,
      accentColor: AppColors.primaryColor,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: AppColors.primaryColorMaterial,
        accentColor: AppColors.primaryColor,
        brightness: Brightness.light,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        centerTitle: false,
        elevation: 10,
        shadowColor: AppColors.grey1,
        titleTextStyle: Ts.semiBold17(Colors.black),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      tabBarTheme: TabBarTheme(
        unselectedLabelColor: AppColors.grey4,
        labelColor: AppColors.primaryColor,
        indicatorColor: AppColors.primaryColor,
        dividerColor: AppColors.primaryColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              textStyle: Ts.regular15(Colors.white))),
    );
  }
}
