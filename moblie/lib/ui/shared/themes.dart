import 'package:flutter/material.dart';
import 'package:internship/core/constant/constants.dart';

import '../../core/constant/app_colors.dart';

var darkMaterialTheme = ThemeData.dark().copyWith(
    primaryColor: AppColors.app_color_primary,
    primaryColorDark: AppColors.app_color_primary_variant,
    textTheme: ThemeData.dark().textTheme.apply(
          fontFamily: Constants.app_font_name,
        ),
    primaryTextTheme: ThemeData.dark().textTheme.apply(
          fontFamily: Constants.app_font_name,
        ),
    colorScheme: ColorScheme.dark(
            primary: AppColors.app_color_primary,
            secondary: AppColors.app_color_secondary,
            onPrimary: AppColors.app_color_on_primary,
            background: Colors.white,
            onSecondary: AppColors.app_color_on_secondary)
        .copyWith(secondary: AppColors.app_color_secondary));

var primaryMaterialTheme = ThemeData(
  useMaterial3: false,
  fontFamily: Constants.app_font_name,
  primaryColor: AppColors.app_color_primary,
  primaryColorDark: AppColors.app_color_primary_variant,
  colorScheme: ColorScheme.light(
    brightness: Brightness.light,
    primary: Color(0xFF734C9D),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFEFDBFF),
    onPrimaryContainer: Color(0xFF2B0052),
    secondary: Color(0xFF655A6F),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFEDDDF6),
    onSecondaryContainer: Color(0xFF21182A),
    tertiary: Color(0xFF805158),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFFFD9DD),
    onTertiaryContainer: Color(0xFF321017),
    error: Color(0xFFBA1A1A),
    errorContainer: Color(0xFFFFDAD6),
    onError: Color(0xFFFFFFFF),
    onErrorContainer: Color(0xFF410002),
    background: Color(0xFFFFFBFF),
    onBackground: Color(0xFF1D1B1E),
    outline: Color(0xFF7B757E),
    onInverseSurface: Color(0xFFF5EFF4),
    inverseSurface: Color(0xFF322F33),
    inversePrimary: Color(0xFFDCB8FF),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF734C9D),
    outlineVariant: Color(0xFFCCC4CE),
    scrim: Color(0xFF000000),
    surface: Color(0xFFFEF7FC),
    onSurface: Color(0xFF1D1B1E),
    surfaceVariant: Color(0xFFE9E0EB),
    onSurfaceVariant: Color(0xFF4A454E),
  ),
).copyWith();
