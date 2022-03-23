import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalization {
  final Locale locale;

  AppLocalization(this.locale);

  static AppLocalization? of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  late Map<String, String> _localizedValues;

  Future loadLanguage() async {
    final String jsonFile = await rootBundle
        .loadString("assets/languages/${locale.languageCode}.json");
    Map<String, dynamic> _jsonInMap = json.decode(jsonFile);
    // to convert  _jsonInMap (String , dynamic) to >>> (String , String)
    _localizedValues =
        _jsonInMap.map((key, value) => MapEntry(key, value.toString()));
  }

  String? translate(String key) {
    return _localizedValues[key];
  }

  static const LocalizationsDelegate<AppLocalization> delegate =
  _AppLocalizationDelegate();
}

class _AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const _AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalization> load(Locale locale) async {
    AppLocalization localization = AppLocalization(locale);
    await localization.loadLanguage();
    return localization;
  }

  @override
  bool shouldReload(_AppLocalizationDelegate old) => false;
}