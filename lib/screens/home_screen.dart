import 'package:asar_app/data/models/language_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'test2.dart';

String? localLanguageCode;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("home_title".tr()),
        actions: <Widget>[
          PopupMenuButton<Language>(
            icon: const Icon(Icons.language),
            onSelected: (val) {
              setState(() {
                EasyLocalization.of(context)!.setLocale(Locale(val.code));
              });
            },
            itemBuilder: (BuildContext context) {
              return Language.getListOfLanguages().map((Language language) {
                return PopupMenuItem<Language>(
                  value: language,
                  child: Text(language.name),
                );
              }).toList();
            },
          ),
        ],
      ),

    );
  }
}
