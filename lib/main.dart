import 'package:asar_app/BLoCs/registration_bloc/registration_bloc.dart';
import 'package:asar_app/constants/colors.dart';
import 'package:asar_app/screens/splash_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<RegistrationBloc>(create: (context) => RegistrationBloc()),
    ],
    child: EasyLocalization(
        supportedLocales: const [Locale('en', ''), Locale('ar', '')],
        path: 'assets/languages',
        fallbackLocale: const Locale('ar', ''),
        child: MyApp()),
  ));
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
