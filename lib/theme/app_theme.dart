import 'package:flutter/material.dart';

import 'colors.dart';

//Android Light Theme
ThemeData androidLightTheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  applyElevationOverlayColor: false,
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontFamily: "Inter",
      fontSize: 36,
      fontWeight: FontWeight.w900,
      overflow: TextOverflow.ellipsis,
    ),
    titleMedium: TextStyle(
      fontFamily: "Inter",
      fontSize: 20,
      fontWeight: FontWeight.w600,
      overflow: TextOverflow.ellipsis,
    ),
    titleSmall: TextStyle(
      fontFamily: "Inter",
      fontSize: 16,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
    ),
    bodyLarge: TextStyle(
      fontFamily: "Inter",
      fontSize: 24,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
    ),
    bodyMedium: TextStyle(
      fontFamily: "Inter",
      fontSize: 18,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
    ),
    bodySmall: TextStyle(
      fontFamily: "Inter",
      fontSize: 12,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
    ),
    labelLarge: TextStyle(
      fontFamily: "Inter",
      fontSize: 30,
      fontWeight: FontWeight.w600,
      overflow: TextOverflow.ellipsis,
    ),
    labelMedium: TextStyle(
      fontFamily: "Inter",
      fontSize: 20,
      fontWeight: FontWeight.w600,
      overflow: TextOverflow.ellipsis,
    ),
    labelSmall: TextStyle(
      fontFamily: "Inter",
      fontSize: 10,
      fontWeight: FontWeight.w600,
      overflow: TextOverflow.ellipsis,
    ),
  ),
  // textTheme: GoogleFonts.montserratAlternatesTextTheme(Typography.dense2021),
  colorScheme: ColorScheme.light(
    surface: kLightBackgroundColor,
    primary: kDarkBackgroundColor,
    inversePrimary: Colors.grey.shade400,
    secondary: kAccentColor,
    brightness: Brightness.light,
    error: kErrorColor,
  ),
);

//Android Dark Theme
ThemeData androidDarkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  applyElevationOverlayColor: false,
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontFamily: "Inter",
      fontSize: 36,
      fontWeight: FontWeight.w900,
      overflow: TextOverflow.ellipsis,
    ),
    titleMedium: TextStyle(
      fontFamily: "Inter",
      fontSize: 20,
      fontWeight: FontWeight.w600,
      overflow: TextOverflow.ellipsis,
    ),
    titleSmall: TextStyle(
      fontFamily: "Inter",
      fontSize: 16,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
    ),
    bodyLarge: TextStyle(
      fontFamily: "Inter",
      fontSize: 24,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
    ),
    bodyMedium: TextStyle(
      fontFamily: "Inter",
      fontSize: 18,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
    ),
    bodySmall: TextStyle(
      fontFamily: "Inter",
      fontSize: 12,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
    ),
    labelLarge: TextStyle(
      fontFamily: "Inter",
      fontSize: 30,
      fontWeight: FontWeight.w600,
      overflow: TextOverflow.ellipsis,
    ),
    labelMedium: TextStyle(
      fontFamily: "Inter",
      fontSize: 20,
      fontWeight: FontWeight.w600,
      overflow: TextOverflow.ellipsis,
    ),
    labelSmall: TextStyle(
      fontFamily: "Inter",
      fontSize: 10,
      fontWeight: FontWeight.w600,
      overflow: TextOverflow.ellipsis,
    ),
  ),
  // textTheme: GoogleFonts.montserratAlternatesTextTheme(Typography.dense2021),
  colorScheme: ColorScheme.dark(
    surface: kDarkBackgroundColor,
    primary: kLightBackgroundColor,
    inversePrimary: Colors.grey.shade600,
    secondary: kAccentColor,
    brightness: Brightness.dark,
    error: kErrorColor,
  ),
);
