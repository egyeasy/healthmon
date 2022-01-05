import 'package:flutter/material.dart';
import 'package:healthmon/strings.dart';
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

void setIntSharedPreference(String key, int value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  await prefs.setInt(key, value);
}

Future<int> getIntSharedPreference(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.getInt(key) ?? 0;
}

void setDateTimeSharedPreference(String key, DateTime value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  print(value.toString());

  await prefs.setString(key, value.toString());
}

Future<DateTime> getDateTimeSharedPreference(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  return DateTime.parse(prefs.getString(key) ?? nullDateTimeString);
}
