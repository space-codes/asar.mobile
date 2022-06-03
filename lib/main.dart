import 'package:asar_app/constants/colors.dart';
import 'package:asar_app/screens/splash_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white,
  ));
  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('en', ''), Locale('ar', '')],
        path: 'assets/languages',
        fallbackLocale: const Locale('ar', ''),
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: context.locale == "ar" ? "مداد" : "Medad",
        color: mainColor,
        theme: ThemeData(fontFamily: "DinReg"),
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: SplashScreen());
  }
}
