import 'dart:ui';

import 'package:asar_app/constants/colors.dart';
import 'package:asar_app/screens/register_screen.dart';
import 'package:asar_app/utils/navigation_funs.dart';
import 'package:asar_app/widgets/media_button.dart';
import 'package:asar_app/widgets/text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 45,),
                Center(child: SvgPicture.asset("assets/images/logo.svg")),
                SizedBox(
                  height: 25,
                ),
                Text("create_new_acc".tr(),
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 5,
                ),
                Text("register_message".tr(),
                    style: TextStyle(fontSize: 16, color: grayColor)),
                SizedBox(
                  height: 20,
                ),
                myTextFormField(labelText: "email_text"),
                SizedBox(
                  height: 20,
                ),
                myTextFormField(labelText: "password_text"),
                SizedBox(
                  height: 15,
                ),
                myButton(onPressed: () {}, title: "create"),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Flexible(
                        flex: 1, child: Container(color: mainColor, height: 1)),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Text("register_by".tr(), style: TextStyle(
                          color: mainColor , fontSize: 15 , fontWeight: FontWeight.w600
                      ),),
                    ),
                    Flexible(
                        flex: 1, child: Container(color: mainColor, height: 1)),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      flex: 5,
                      child: myMediaButton(
                          onPressed: () {},
                          title: "gmail",
                          imagePath: "assets/images/Google__G__Logo.svg"),
                    ),
                    Flexible(flex: 2, child: SizedBox()),
                    Flexible(
                      flex: 5,
                      child: myMediaButton(
                          onPressed: () {},
                          title: "facebook",
                          imagePath: "assets/images/facebook.svg"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
