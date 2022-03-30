import 'package:asar_app/constants/colors.dart';
import 'package:asar_app/utils/adaptive_text_size.dart';
import 'package:asar_app/widgets/text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/button.dart';
import '../widgets/row_of_register_by.dart';
import '../widgets/row_of_register_by_google_and_facebook.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: EdgeInsets.only(left: width * 0.04, right: width * 0.04),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.09,
                ),
                Center(child: SvgPicture.asset("assets/images/logo.svg")),
                SizedBox(
                  height: height * 0.04,
                ),
                Text("create_new_acc".tr(),
                    style: TextStyle(
                        fontSize:
                            adaptiveTextSize.getAdaptiveTextSize(25, context),
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 5,
                ),
                Text("register_message".tr(),
                    style: TextStyle(
                        fontSize:
                            adaptiveTextSize.getAdaptiveTextSize(16, context),
                        color: grayColor)),
                SizedBox(
                  height: height * 0.03,
                ),
                myTextFormField(
                    labelText: "email_text",
                    height: height * 0.065,
                    context: context),
                SizedBox(
                  height: height * 0.02,
                ),
                myTextFormField(
                    labelText: "password_text",
                    height: height * 0.065,
                    context: context),
                SizedBox(
                  height: height * 0.03,
                ),
                myButton(onPressed: () {}, title: "create", context: context),
                SizedBox(
                  height: height * 0.025,
                ),
                rowOfRegisterBy(context: context, title: "register_by"),
                SizedBox(
                  height: height * 0.025,
                ),
                rowOfRegisterByGoogleAndFacebook(context: context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
