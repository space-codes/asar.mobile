import 'package:asar_app/constants/colors.dart';
import 'package:flutter/material.dart';

import '../utils/adaptive_text_size.dart';
import '../widgets/my_back_button.dart';

class DetailsScreen extends StatelessWidget {
  final String? imagePath;
  final String? text;

  const DetailsScreen({Key? key, this.imagePath, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: height * 0.35,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(imagePath.toString()),
                          fit: BoxFit.cover)),
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
                        height: height, width: width, context: context))
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
                      text.toString(),
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
        ),
      ),
    );
  }
}
