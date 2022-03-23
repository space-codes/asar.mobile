import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/home_screen.dart';
import 'utils/localization/app_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  Locale locale = Locale(sharedPreferences.get("localLanguage").toString());

  runApp(MaterialApp(
      title: 'ASAR',
      localizationsDelegates: const [
        AppLocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      locale: locale,
      supportedLocales: const [
        Locale('en', ''),
        Locale('ar', ''),
      ],
      localeResolutionCallback: (deviceLocale, supportedLocale) {
        for (var locale in supportedLocale) {
          if (locale.languageCode == deviceLocale!.languageCode) {
            return deviceLocale;
          }
        }
        return supportedLocale.first;
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(
        locale: locale,
      )));
}
