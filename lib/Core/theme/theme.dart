//this class is gonna contain whole theme for app

import 'package:blogging/Core/theme/App_pallete.dart';
import 'package:flutter/material.dart';

class AppTheme{
  //everytime when you try to set border passing Color should not be compulsory,
  // --color should take some default color, that we can achieve using --
  //inside ([Colors color = AppPallete.borderColor])
  static _border([Color color = AppPallete.borderColor]) => OutlineInputBorder(
      borderSide: BorderSide(
        color: color,
        width: 3,
      ),
      borderRadius: BorderRadius.circular(40)
  );

  static final darkThemeMode = ThemeData.dark().copyWith(
    //now here i want to change the
    appBarTheme: const AppBarTheme(
      backgroundColor: AppPallete.backgroundColor
    ),
    scaffoldBackgroundColor: AppPallete.backgroundColor,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(20),
      enabledBorder: _border(), //assigned OutLinedInputBorder to _border
      focusedBorder: _border(AppPallete.gradient2),//now here i want to change some color of border while focused
      //so convert _border to function
    ),
  );
}