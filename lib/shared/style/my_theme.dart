import 'package:flutter/material.dart';
import 'package:news_app/shared/style/my_color.dart';

class MyTheme {
  static ThemeData light = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 22,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.only(
          bottomStart: Radius.circular(35),
          bottomEnd: Radius.circular(35),
        ),
      ),
      backgroundColor: Color(0xff39A552),
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.white, size: 30),
      toolbarHeight: 60,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: MyColor.whiteColor,
      ),
      headline2: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: MyColor.blackLightColor,
      ),
    ),
    drawerTheme: const DrawerThemeData(
      elevation: 0,
    ),
  );
}
