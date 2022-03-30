import 'package:asar_app/utils/adaptive_text_size.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

import '../constants/colors.dart';

Widget rowOfRegisterBy({BuildContext? context , String? title}){
  return Row(
    children: [
      Flexible(
          flex: 1, child: Container(color: mainColor, height: 1)),
      Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Text(
          title!.tr(),
          style: TextStyle(
              color: mainColor,
              fontSize: adaptiveTextSize.getAdaptiveTextSize(15, context!),
              fontWeight: FontWeight.w600),
        ),
      ),
      Flexible(
          flex: 1, child: Container(color: mainColor, height: 1)),
    ],
  );
}