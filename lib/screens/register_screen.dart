import 'package:asar_app/BLoCs/registration_bloc/registration_bloc.dart';
import 'package:asar_app/constants/colors.dart';
import 'package:asar_app/utils/adaptive_text_size.dart';
import 'package:asar_app/widgets/text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/navigation_funs.dart';
import '../widgets/button.dart';
import 'home_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late RegistrationBloc registrationBloc;
  final _formKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void initState() {
    registrationBloc = BlocProvider.of<RegistrationBloc>(context);
    super.initState();
  }

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
                  buildBlocBuilder(
                      _formKey,
                      userNameController,
                      passwordController,
                      confirmPasswordController,
                      registrationBloc),
                  // myButton(onPressed: () {}, title: "create", context: context),
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

  BlocBuilder<RegistrationBloc, RegistrationState> buildBlocBuilder(
      GlobalKey<FormState> _formKey,
      TextEditingController userNameController,
      TextEditingController passwordController,
      TextEditingController confirmPasswordController,
      RegistrationBloc registrationBloc) {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
        builder: (cxt, state) {
      return GestureDetector(
        onTap: () {
          if (_formKey.currentState!.validate()) {
            registrationBloc.add(RegisterEvent(
                userName: userNameController.text,
                password: passwordController.text,
                confirmPassword: confirmPasswordController.text));

            if (state == RegisterLoading) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    duration: Duration(seconds: 2),
                    content: Text(
                      "loading",
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: mainColor),
              );
              shiftByReplacement(context, HomeScreen());
            } else if (state == RegisterError) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    duration: Duration(seconds: 2),
                    content: Text(
                      'تم تسجيل الدخول بنجاح',
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.red),
              );
            }
          }
        },
        child: myButton(title: "create", context: context),
      );
    });
  }
}
