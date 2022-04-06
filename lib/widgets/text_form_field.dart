import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../utils/adaptive_text_size.dart';

class CustomTextFormField extends StatefulWidget {
  final String? labelText;
  final double? height;
  final TextEditingController? textEditingController;

  const CustomTextFormField(
      {Key? key, this.labelText, this.height, this.textEditingController})
      : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool visibility = true;
  Icon trailerIcon = Icon(Icons.visibility);

  OutlineInputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: secondColor, width: 2),
  );
  OutlineInputBorder errorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: secondColor, width: 2),
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textEditingController,
      obscureText: (widget.labelText == "password_text" ||
          widget.labelText == "confirm_password") && visibility ? true : false,
      validator: (value) {
        if (value == null || value.isEmpty) {
          if (context.locale.languageCode == "ar") {
            return 'ادخل بيانات هذا الحقل';
          } else {
            return 'Please, enter the data of this field';
          }
        }
        return null;
      },
      cursorColor: mainColor,
      decoration: InputDecoration(
          suffixIcon: widget.labelText == "password_text" ||
                  widget.labelText == "confirm_password"
              ? InkWell(
                  onTap: () {
                    setState(() {
                      visibility = !visibility;
                      visibility == true
                          ? trailerIcon = Icon(
                              Icons.visibility,
                              color: mainColor,
                            )
                          : trailerIcon = Icon(
                              Icons.visibility_off,
                              color: mainColor,
                            );
                    });
                  },
                  child: trailerIcon)
              : null,
          contentPadding:
              const EdgeInsets.only(left: 8, right: 8, bottom: 0, top: 0),
          labelText: widget.labelText!.tr(),
          filled: true,
          fillColor: Colors.white,
          border: border,
          labelStyle: TextStyle(
              color: mainColor,
              fontSize: adaptiveTextSize.getAdaptiveTextSize(17, context),
              fontWeight: FontWeight.w700),
          enabledBorder: border,
          errorBorder: errorBorder,
          focusedErrorBorder: errorBorder,
          errorStyle: TextStyle(color: Colors.red),
          focusedBorder: border),
    );
  }
}
