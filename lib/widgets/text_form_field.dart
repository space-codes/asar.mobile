import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

Widget myTextFormField({
  String? labelText,
}) {
  OutlineInputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: secondColor, width: 2),
  );

  return TextFormField(
    decoration: InputDecoration(
        labelText: labelText!.tr(),
        filled: true,
        fillColor: Colors.white,
        border: border,
        labelStyle: TextStyle(
            color: mainColor, fontSize: 18, fontWeight: FontWeight.w700),
        enabledBorder: border,
        focusedBorder: border),
  );
}
