import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:getx_shablon/core/style/text_style.dart";

import "app_colors.dart";
import "color_schema.dart";

@immutable
final class AppThemes {
  final ThemeMode mode;
  final ThemeData darkTheme;
  final ThemeData lightTheme;
  final BuildContext context;


  AppThemes(this.context, {required this.mode})
      : darkTheme = ThemeData(
          brightness: Brightness.dark,
          colorScheme: darkColorScheme,
          scaffoldBackgroundColor: Theme.of(context).colorScheme.primary,
          textTheme:  AppTextStyle(context),
        ),
        lightTheme = ThemeData(
          brightness: Brightness.light,
          colorScheme: lightColorScheme,
          scaffoldBackgroundColor: Colors.white,
          textTheme:  AppTextStyle(context)
        );

  static ThemeData light() => ThemeData(
        brightness: Brightness.light,
        colorScheme: lightColorScheme,
        scaffoldBackgroundColor: AppColors.appMainColorLight,
      );

  static ThemeData dark() => ThemeData(
        brightness: Brightness.dark,
        colorScheme: darkColorScheme,
        scaffoldBackgroundColor:  AppColors.appMainColor,
      );

  ThemeData computeTheme() {
    switch (mode) {
      case ThemeMode.light:
        return lightTheme;
      case ThemeMode.dark:
        return darkTheme;
      case ThemeMode.system:
        return PlatformDispatcher.instance.platformBrightness == Brightness.dark
            ? darkTheme
            : lightTheme;
    }
  }
}
