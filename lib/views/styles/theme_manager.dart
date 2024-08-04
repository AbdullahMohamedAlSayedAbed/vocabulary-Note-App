import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vocabularynoteapp/views/styles/color_manager.dart';

abstract class ThemeManager {
  static ThemeData getAppTheme() {
    return ThemeData(
      scaffoldBackgroundColor: ColorManager.black,
      appBarTheme: const AppBarTheme(
        backgroundColor: ColorManager.black,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: ColorManager.white,
          fontSize: 21,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManager.black,
        )
      ),
    );
  }
}
