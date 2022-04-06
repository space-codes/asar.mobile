import 'package:asar_app/constants/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../utils/adaptive_text_size.dart';

Widget myButton(
    {String? title, BuildContext? context}) {
  return Container(
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(title!.tr(),
            style: TextStyle(
                color: Colors.white,
                fontSize:
                    adaptiveTextSize.getAdaptiveTextSize(18, context!))),
      ),
    ),
    decoration: BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.all(Radius.circular(10))),
  );
}
