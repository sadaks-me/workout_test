import 'package:flutter/material.dart';

var appTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.black,
  scaffoldBackgroundColor: Colors.black,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.white), // White text
    bodyMedium: TextStyle(color: Colors.white), // White text
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.white, // White button background
    textTheme: ButtonTextTheme.primary, // Black text on buttons
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      backgroundColor: Colors.grey[900], // Black text on buttons
    ),
  ),
  cardColor: Colors.grey[900],
  dropdownMenuTheme: DropdownMenuThemeData(
    menuStyle: MenuStyle(
      padding: WidgetStateProperty.all(EdgeInsets.symmetric(horizontal: 16)),
      backgroundColor: WidgetStateProperty.all(Colors.grey[800]),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0), // Rounded corners
          side: const BorderSide(color: Colors.white),
        ),
      ),
    ),
  ),
);
