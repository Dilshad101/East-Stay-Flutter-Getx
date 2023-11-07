import 'package:east_stay_vendor/utils/colors.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: 'Poppins',
  scaffoldBackgroundColor: AppColor.backgroundColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColor.backgroundColor,
    centerTitle: true,
    elevation: .5,
    titleTextStyle: TextStyle(
      fontSize: 18,
      color: AppColor.secondaryColor,
      fontWeight: FontWeight.w600,
      fontFamily: 'Poppins',
    ),
  ),
);
