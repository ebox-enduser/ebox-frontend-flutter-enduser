import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String prefSelectedLanguageCode = "SelectedLanguageCode";
const String prefSelectedCountryCode = "SelectedCountryCode";

setLocale(String languageCode, String countryCode) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  debugPrint("Preference Updated $languageCode");
  prefs.setString(prefSelectedLanguageCode, languageCode);
  prefs.setString(prefSelectedCountryCode, countryCode);
}

Future<Locale> getLocale() async {
  // ignore: no_leading_underscores_for_local_identifiers
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String languageCode = _prefs.getString(prefSelectedLanguageCode) ?? "en";
  String countryCode = _prefs.getString(prefSelectedCountryCode) ?? "US";
  return _locale(languageCode, countryCode);
}

Locale _locale(String languageCode, String countryCode) {
  // ignore: unnecessary_null_comparison
  return languageCode != null && languageCode.isNotEmpty
      ? Locale(languageCode, countryCode)
      : const Locale('en', 'US');
}
