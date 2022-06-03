import 'package:asar_app/constants/colors.dart';
import 'package:asar_app/screens/home_screen.dart';
import 'package:asar_app/utils/adaptive_text_size.dart';
import 'package:asar_app/utils/navigation_funs.dart';
import 'package:asar_app/widgets/row_of_create_acc.dart';
import 'package:asar_app/widgets/text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/button.dart';
import '../widgets/row_of_register_by.dart';
import '../widgets/row_of_register_by_google_and_facebook.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AdaptiveTextSize adaptiveTextSize = AdaptiveTextSize();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: EdgeInsets.only(left: width * 0.04, right: width * 0.04),
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * 0.06,
                  ),
                  Center(
                      child: SvgPicture.asset(
                    "assets/images/logo.svg",
                    height: height * 0.22,
                  )),
                  SizedBox(
                    height: height * 0.012,
                  ),
                  Text("welcome_back".tr(),
                      style: TextStyle(
                          fontSize:
                              adaptiveTextSize.getAdaptiveTextSize(25, context),
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: height * 0.007,
                  ),
                  Text("login_message".tr(),
                      style: TextStyle(
                          fontSize:
                              adaptiveTextSize.getAdaptiveTextSize(16, context),
                          color: grayColor)),
                  SizedBox(
                    height: height * 0.030,
                  ),
                  CustomTextFormField(
                    labelText: "user_name",
                    height: height * 0.065,
                  ),
                  SizedBox(
                    height: height * 0.022,
                  ),
                  CustomTextFormField(
                    labelText: "password_text",
                    height: height * 0.065,
                  ),
                  SizedBox(
                    height: height * 0.018,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("forget_password".tr(),
                          style: TextStyle(
                              color: secondColor,
                              fontSize: adaptiveTextSize.getAdaptiveTextSize(
                                  15, context),
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.018,
                  ),
                  GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                duration: Duration(seconds: 2),
                                content: Text(
                                  'تم تسجيل الدخول بنجاح',
                                  style: TextStyle(color: Colors.white),
                                ),
                                backgroundColor: mainColor),
                          );
                          shiftByReplacement(context, HomeScreen());
                        }
                      },
                      child: myButton(title: "login", context: context)),
                  SizedBox(height: height * 0.025,),
                  //rowOfRegisterBy(context: context, title: "login_by"),
                  SizedBox(
                    height: height * 0.025,
                  ),
                  //rowOfRegisterByGoogleAndFacebook(context: context),
                  SizedBox(
                    height: height * 0.035,
                  ),
                  rowOfCreateAccount(context: context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
