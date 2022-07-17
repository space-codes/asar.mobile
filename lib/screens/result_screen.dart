import 'dart:io';

import 'package:asar_app/constants/colors.dart';
import 'package:flutter/material.dart';

import '../utils/adaptive_text_size.dart';
import '../widgets/my_back_button.dart';

class ResultScreen extends StatefulWidget {
  final File? image;
  final String? result;

  const ResultScreen({Key? key, this.image, this.result}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: widget.result != "response" ? Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: height * 0.35,
                child: Image.file(widget.image!),
              ),
              Positioned(
                  left: Localizations.localeOf(context).languageCode == "ar"
                      ? null
                      : 15,
                  right: Localizations.localeOf(context).languageCode == "ar"
                      ? 15
                      : null,
                  top: 10,
                  child: myBackButton(
                    height: height,
                    width: width,
                    context: context,
                  ))
            ],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                  left: width * 0.035,
                  right: width * 0.035,
                  top: height * 0.035,
                  bottom: height * 0.035),
              child: SingleChildScrollView(
                child: Container(
                  color: Colors.transparent,
                  child: SelectableText(
                    widget.result!,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: adaptiveTextSize.getAdaptiveTextSize(
                            17, context)),
                  ),
                ),
              ),
            ),
          )
        ],
      ) : Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: height * 0.35,
                child: Image.file(widget.image!),
              ),
              Positioned(
                  left: Localizations.localeOf(context).languageCode == "ar"
                      ? null
                      : 15,
                  right: Localizations.localeOf(context).languageCode == "ar"
                      ? 15
                      : null,
                  top: 30,
                  child: myBackButton(
                    height: height,
                    width: width,
                    context: context,
                  ))
            ],
          ),
          Expanded(
            child: Center(
              child: CircularProgressIndicator(
                color: mainColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
