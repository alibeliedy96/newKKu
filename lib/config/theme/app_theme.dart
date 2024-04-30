import 'package:flutter/material.dart';

ThemeData ThemeMangerApp() {
  return ThemeData(
    useMaterial3: true,
    fontFamily: 'NunitoSans',
    brightness: Brightness.light,

    appBarTheme: const AppBarTheme(
      elevation: 0,
      color: Colors.white,
      centerTitle: true),
    // text edit field
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.transparent,
      filled: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      hintStyle:TextStyle(fontSize: 14,color: Colors.grey.shade400),
      labelStyle: TextStyle(fontSize: 14,color: Colors.grey.shade400),
      errorStyle: TextStyle(fontSize: 14,color: Colors.grey.shade400),
      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black,width: 1),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black,width: 1),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black,width: 1),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      focusedErrorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 1),
        borderRadius: BorderRadius.all(Radius.circular(15)))));
}
