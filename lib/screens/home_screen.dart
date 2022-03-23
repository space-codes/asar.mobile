import 'package:asar_app/utils/localization/language_model.dart';
import 'package:asar_app/utils/localization/translate_fun.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'register_screen.dart';

String? localLanguageCode;

class HomeScreen extends StatefulWidget {
  final Locale? locale;

  const HomeScreen({Key? key, this.locale}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _select(Language? language) async {
    Language? _selectedLanguage;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      _selectedLanguage = language;
      sharedPreferences.setString("localLanguage", language!.code);
    });
    print(sharedPreferences.getString("localLanguage"));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(translateHere(context , "home_title")!),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              translateHere(context, "home_title")!,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const RegisterScreen()));
              },
              child: Text(translateHere(context, "register_title")!),
            )
          ],
        ),
      ),
    );
  }
}

