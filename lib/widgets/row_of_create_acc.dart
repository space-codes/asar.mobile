import 'package:asar_app/utils/adaptive_text_size.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

import '../constants/colors.dart';
import '../screens/register_screen.dart';
import '../utils/navigation_funs.dart';

Widget rowOfCreateAccount({BuildContext? context}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text("don't_have_account".tr(),
          style: TextStyle(
              color: grayColor,
              fontSize: adaptiveTextSize.getAdaptiveTextSize(15, context!),
              fontFamily: "DinReg",
              fontWeight: FontWeight.w600)),
      SizedBox(
        width: 10,
      ),
      GestureDetector(
        onTap: () {
          normalShift(context, RegisterScreen());
        },
        child: Text("sign_up".tr(),
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: secondColor,
              fontSize: adaptiveTextSize.getAdaptiveTextSize(15, context),
              fontFamily: "DinReg",
              fontWeight: FontWeight.w600,
            )),
      ),
    ],
  );
}
