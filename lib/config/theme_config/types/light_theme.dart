import 'package:flutter/material.dart';

import '../../../src/core/constants/theme_constants/app_colors.dart';
import '../../../src/core/constants/theme_constants/global_theme_constants.dart';
import '../ui_theme/app_bar_theme.dart';
import '../ui_theme/input_decoration_theme.dart';

class LightTheme {
  static final ThemeData kThemeConfig = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.whiteColor,
    textTheme: GlobalThemeConstant.appTextTheme.apply(
      displayColor: AppColors.blackColor,
      bodyColor: AppColors.blackColor,
      fontFamily: GlobalThemeConstant.fontFamilyVal,
    ),
    cardTheme: CardTheme(
      elevation: 1.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      color: AppColors.whiteColor.withValues(alpha: 0.9),
    ),
    inputDecorationTheme: AppInputDecorationTheme.kInputDecorationTheme,
    appBarTheme: AppsAppBarTheme.kDefaultAppBarTheme.copyWith(
      foregroundColor: AppColors.whiteColor,
      backgroundColor: AppColors.whiteColor,
    ),
  );
}
