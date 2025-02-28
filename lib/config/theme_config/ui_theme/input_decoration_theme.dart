import 'package:flutter/material.dart';

import '../../../src/core/constants/theme_constants/app_colors.dart';
import '../../../src/core/constants/theme_constants/global_theme_constants.dart';
import 'border_theme.dart';

class AppInputDecorationTheme {
  static InputDecorationTheme kInputDecorationTheme = InputDecorationTheme(
    /// text style  of input decoration theme
    labelStyle: GlobalThemeConstant.appTextTheme.labelMedium,
    hintStyle: GlobalThemeConstant.appTextTheme.bodyMedium,
    errorStyle: GlobalThemeConstant.appTextTheme.bodyMedium,
    prefixStyle: GlobalThemeConstant.appTextTheme.bodyMedium,
    suffixStyle: GlobalThemeConstant.appTextTheme.bodyMedium,

    /// ui properties
    isDense: true,
    constraints: BoxConstraints(maxHeight: 40.0),
    contentPadding: EdgeInsets.all(8.0),

    /// border properties
    border: AppBorderTheme.kDefaultBorderTheme,
    disabledBorder: AppBorderTheme.kDefaultBorderTheme,
    enabledBorder: AppBorderTheme.kDefaultBorderTheme.copyWith(
      borderSide: BorderSide(color: AppColors.appThemeColor),
    ),
    focusedBorder: AppBorderTheme.kDefaultBorderTheme.copyWith(
      borderSide: BorderSide(color: AppColors.appThemeColor),
    ),
    focusedErrorBorder: AppBorderTheme.kDefaultBorderTheme.copyWith(
      borderSide: BorderSide(color: AppColors.errorBorderColor),
    ),
    errorBorder: AppBorderTheme.kDefaultBorderTheme.copyWith(
      borderSide: BorderSide(color: AppColors.errorBorderColor),
    ),
  );
}
