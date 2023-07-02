import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAppTheme {
  static final ThemeData brightTheme = ThemeData(
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.pink,
      centerTitle: true,
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 22.w),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.pink,
      background: const Color.fromRGBO(255, 254, 222, 1),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 22.w),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.pink,
      brightness: Brightness.dark,
    ),
  );
}
