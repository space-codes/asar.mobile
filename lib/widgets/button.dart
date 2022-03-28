import 'package:asar_app/constants/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

Widget myButton({VoidCallback? onPressed, String? title}) {
  return GestureDetector(
    child: Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(title!.tr() , style: TextStyle(
            color: Colors.white
          )),
        ),
      ),
      decoration: BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
    ),
  );
}
