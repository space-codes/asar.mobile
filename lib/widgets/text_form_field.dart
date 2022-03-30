import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../utils/adaptive_text_size.dart';

Widget myTextFormField(
    {String? labelText, double? height, BuildContext? context}) {
  OutlineInputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: secondColor, width: 2),
  );

  return Container(
    height: height,
    child: TextFormField(
      decoration: InputDecoration(
          labelText: labelText!.tr(),
          filled: true,
          fillColor: Colors.white,
          border: border,
          labelStyle: TextStyle(
              color: mainColor,
              fontSize: adaptiveTextSize.getAdaptiveTextSize(17, context!),
              fontWeight: FontWeight.w700),
          enabledBorder: border,
          focusedBorder: border),
    ),
  );
}
