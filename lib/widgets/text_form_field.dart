import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../utils/adaptive_text_size.dart';

Widget myTextFormField(
    {String? labelText,
    double? height,
    BuildContext? context,
    bool? isPassword = false}) {
  OutlineInputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: secondColor, width: 2),
  );

  bool visibility = true;
  Icon trailerIcon = Icon(Icons.visibility);

  return Padding(
    padding: const EdgeInsets.all(0),
    child: StatefulBuilder(
      builder: (BuildContext context, void Function(void Function()) setState) {
        return TextFormField(
          obscureText: isPassword == true ? true : false,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'ادخل بيانات هذا الحقل';
            }
            return null;
          },
          cursorColor: mainColor,
          decoration: InputDecoration(
              // suffixIcon: isPassword == true
              //     ? InkWell(
              //         onTap: () {
              //           setState(){
              //             visibility = !visibility;
              //             visibility == true
              //                 ? trailerIcon = Icon(
              //               Icons.visibility,
              //               color: Colors.grey,
              //             )
              //                 : trailerIcon = Icon(
              //               Icons.visibility_off,
              //               color: Colors.grey,
              //             );
              //           }
              //         },
              //         child: trailerIcon)
              //     : null,
              contentPadding:
                  const EdgeInsets.only(left: 8, right: 8, bottom: 0, top: 0),
              labelText: labelText!.tr(),
              filled: true,
              fillColor: Colors.white,
              border: border,
              labelStyle: TextStyle(
                  color: mainColor,
                  fontSize: adaptiveTextSize.getAdaptiveTextSize(17, context),
                  fontWeight: FontWeight.w700),
              enabledBorder: border,
              focusedBorder: border),
        );
      },
    ),
  );
}
