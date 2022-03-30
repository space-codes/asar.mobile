import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/adaptive_text_size.dart';

Widget myMediaButton(
    {VoidCallback? onPressed,
    String? title,
    String? imagePath,
    BuildContext? context}) {
  return GestureDetector(
    child: Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title!.tr(),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize:
                          adaptiveTextSize.getAdaptiveTextSize(16, context!))),
              SizedBox(
                width: 8,
              ),
              SvgPicture.asset(imagePath!)
            ],
          ),
        ),
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 10)]),
    ),
  );
}
