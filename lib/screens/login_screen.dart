import 'package:asar_app/constants/colors.dart';
import 'package:asar_app/data/api_provider/api_provider.dart';
import 'package:asar_app/utils/adaptive_text_size.dart';
import 'package:asar_app/widgets/row_of_create_acc.dart';
import 'package:asar_app/widgets/text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../providers/registration_provider.dart';
import '../utils/navigation_funs.dart';
import '../widgets/button.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AdaptiveTextSize adaptiveTextSize = AdaptiveTextSize();
  final _formKey = GlobalKey<FormState>();

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    final RegistrationProvider? registrationProvider =
        Provider.of<RegistrationProvider>(context);

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
                    textEditingController: userNameController,
                    height: height * 0.065,
                  ),
                  SizedBox(
                    height: height * 0.022,
                  ),
                  CustomTextFormField(
                    labelText: "password_text",
                    textEditingController: passwordController,
                    height: height * 0.065,
                  ),
                  SizedBox(
                    height: height * 0.018,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     Text("forget_password".tr(),
                  //         style: TextStyle(
                  //             color: secondColor,
                  //             fontSize: adaptiveTextSize.getAdaptiveTextSize(
                  //                 15, context),
                  //             fontWeight: FontWeight.w600)),
                  //   ],
                  // ),
                  SizedBox(
                    height: height * 0.018,
                  ),
                  GestureDetector(
                      onTap: () async {
                        await ApiProvider()
                            .login(
                                userName: userNameController.text,
                                password: passwordController.text)
                            .then((value) {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  duration: Duration(seconds: 2),
                                  content: value.message.toString() == "Success"
                                      ? Text(
                                          "success_message".tr(),
                                          style: TextStyle(color: Colors.white),
                                        )
                                      : Text(
                                          "error_message".tr(),
                                          style: TextStyle(color: Colors.white),
                                        ),
                                  backgroundColor:
                                      value.message.toString() == "Success"
                                          ? mainColor
                                          : Colors.red),
                            );
                            shiftByReplacement(context, HomeScreen());
                          }
                        });
                      },
                      child: myButton(title: "login", context: context)),
                  SizedBox(
                    height: height * 0.025,
                  ),
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
