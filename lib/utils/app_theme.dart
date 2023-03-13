import 'package:flutter/material.dart';

final ThemeData _theme = ThemeData();

class AppTheme {
  static TextTheme txtTheme = _theme.textTheme.copyWith(
    labelSmall: _theme.textTheme.labelSmall
        ?.copyWith(fontSize: 10, fontWeight: FontWeight.w500),
    bodySmall: _theme.textTheme.bodySmall?.copyWith(fontSize: 12),
    bodyMedium: _theme.textTheme.bodyMedium
        ?.copyWith(fontSize: 14, fontWeight: FontWeight.w600),
    bodyLarge: _theme.textTheme.bodyText2?.copyWith(fontSize: 16),
    titleLarge: _theme.textTheme.titleLarge
        ?.copyWith(fontSize: 26, fontWeight: FontWeight.w600),
    headlineMedium: _theme.textTheme.headlineMedium
        ?.copyWith(fontSize: 48, fontWeight: FontWeight.normal),
  );

  static ThemeData light = _theme.copyWith(
    colorScheme: ColorScheme.light(
      primary: Color(0xFF1EDD67),
      secondary: Color(0xFF3463FF),
      tertiary: Color(0xFF555555),
    ),
    brightness: Brightness.light,
    useMaterial3: true,
    typography: Typography.material2021(),
    textTheme: txtTheme,
    canvasColor: Color(0xFFA7A7A7),
    backgroundColor: Color(0xFFF7F7F7),
    listTileTheme: ListTileThemeData(
      iconColor: _theme.colorScheme.tertiary,
      tileColor: Colors.transparent,
      selectedTileColor: _theme.canvasColor,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
    ),
    popupMenuTheme: PopupMenuThemeData(
      textStyle: txtTheme.bodySmall,
      color: _theme.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        shape: CircleBorder(),
        textStyle: txtTheme.headlineMedium,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: InputBorder.none,
      fillColor: _theme.canvasColor,
      filled: true,
      iconColor: _theme.colorScheme.tertiary,
    ),
    tabBarTheme: TabBarTheme(
      indicator: UnderlineTabIndicator(borderSide: BorderSide.none),
      labelColor: _theme.colorScheme.primary,
      unselectedLabelColor: Colors.black,
      labelStyle: txtTheme.headlineLarge,
    ),
  );
}
