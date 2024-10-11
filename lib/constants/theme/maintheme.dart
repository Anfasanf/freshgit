import 'package:flutter/material.dart';
import 'appbartheme.dart';

class maintheme{
  static ThemeData lighttheme=ThemeData(
      brightness: Brightness.light,
      colorScheme: ColorScheme.light(
      background: Colors.grey[400],
          primary: Colors.white,
          secondary: Colors.black,
        surface: Colors.indigo.shade300,
          onSurface: Colors.white
    ),
    scaffoldBackgroundColor: Colors.grey[400],
    focusColor: Colors.pink[300],
    appBarTheme: Appbtheme.appbart
  );


  static ThemeData darktheme=ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
        surface: Colors.black,
        onSurface: Colors.blueGrey.shade900,
      background: Colors.black,
      primary: Colors.black,
      secondary: Colors.white
    ),
    scaffoldBackgroundColor: Colors.grey[400],
    primaryColor: Colors.black,
    secondaryHeaderColor: Colors.white,
  );
}