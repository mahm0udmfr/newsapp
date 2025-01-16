import 'package:flutter/material.dart';
import 'package:newsapp/utils/app_styles.dart';
import 'package:newsapp/utils/colors.dart';

class Apptheme {
  static final ThemeData darkTheme = ThemeData(
      primaryColor: AppColor.white,
      scaffoldBackgroundColor: AppColor.black,
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: AppColor.black,
        
      ),
      appBarTheme: const AppBarTheme(
        
        color: AppColor.black,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColor.white)
      ),
      drawerTheme: DrawerThemeData(backgroundColor: AppColor.black),
      textTheme: TextTheme(
          labelLarge: AppStyles.bold16White,
          labelMedium: AppStyles.medium14White,
          headlineLarge: AppStyles.bold20White),
      tabBarTheme: TabBarTheme(
        indicatorColor: AppColor.white,
      ));

  static final ThemeData lightTheme = ThemeData(
      primaryColor: AppColor.black,
      drawerTheme: DrawerThemeData(backgroundColor: AppColor.black),
            bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: AppColor.white,
        
      ),
      scaffoldBackgroundColor: AppColor.white,
      appBarTheme: AppBarTheme(
        color: AppColor.white,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColor.black)
      ),
      textTheme: TextTheme(
          labelLarge: AppStyles.bold16black,
          labelMedium: AppStyles.medium14Black,
          headlineLarge: AppStyles.bold20black),

      tabBarTheme: TabBarTheme(
        indicatorColor: AppColor.black,
      ));
}
