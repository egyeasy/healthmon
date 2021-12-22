import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

TextStyle getTextStyle(double fontSize, Color color) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
  );
}

void setBoolSharedPreference(String key, bool value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  await prefs.setBool(key, value);
}

Future<bool?> getBoolSharedPreference(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.getBool(key);
}

void setStringSharedPreference(String key, String value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  await prefs.setString(key, value);
}

Future<String> getStringSharedPreference(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.getString(key) ?? "";
}
