import 'package:asar_app/constants/colors.dart';
import 'package:asar_app/providers/registration_provider.dart';
import 'package:asar_app/screens/login_screen.dart';
import 'package:asar_app/utils/adaptive_text_size.dart';
import 'package:asar_app/widgets/text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../data/api_provider/api_provider.dart';
import '../utils/navigation_funs.dart';
import '../widgets/button.dart';
import 'home_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

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
        child: SingleChildScrollView(
          child: SafeArea(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * 0.09,
                  ),
                  Center(
                      child: SvgPicture.asset("assets/images/logo.svg",
                          height: height * 0.22)),
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
                  CustomTextFormField(
                    labelText: "user_name",
                    textEditingController: userNameController,
                    height: height * 0.065,
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  CustomTextFormField(
                    labelText: "password_text",
                    textEditingController: passwordController,
                    height: height * 0.065,
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  CustomTextFormField(
                    labelText: "confirm_password",
                    textEditingController: confirmPasswordController,
                    height: height * 0.065,
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  GestureDetector(
                      onTap: () async {
                        await ApiProvider().register(userName: userNameController.text,
                            password: passwordController.text , confirmPassword: confirmPasswordController.text).then((value){
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  duration: Duration(seconds: 2),
                                  content: Text(
                                    value.message.toString(),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  backgroundColor: mainColor),
                            );
                            shiftByReplacement(context, LoginScreen());
                          }
                        });


                        // registrationProvider!.register(
                        //     userName: userNameController.text,
                        //     password: passwordController.text,
                        //     confirmPassword: confirmPasswordController.text);
                        //
                        // if (passwordController.text !=
                        //     confirmPasswordController.text) {
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     SnackBar(
                        //         duration: Duration(seconds: 2),
                        //         content: Text(
                        //           "password_and_confirm_not_matched".tr(),
                        //           style: TextStyle(color: Colors.white),
                        //         ),
                        //         backgroundColor: Colors.red),
                        //   );
                        // } else if (_formKey.currentState!.validate() &&
                        //     registrationProvider.registerLoading) {
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     SnackBar(
                        //         duration: Duration(seconds: 2),
                        //         content: Text(
                        //           "${registrationProvider.registerResponse}",
                        //           style: TextStyle(color: Colors.white),
                        //         ),
                        //         backgroundColor: mainColor),
                        //   );
                        //   shiftByReplacement(context, HomeScreen());
                        // }
                      },
                      child: myButton(title: "create", context: context)),
                  SizedBox(
                    height: height * 0.025,
                  ),
                  // rowOfRegisterBy(context: context, title: "register_by"),
                  // SizedBox(height: height * 0.025,),
                  //rowOfRegisterByGoogleAndFacebook(context: context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
