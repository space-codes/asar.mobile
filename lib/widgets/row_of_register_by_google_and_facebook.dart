import 'package:asar_app/widgets/media_button.dart';
import 'package:flutter/cupertino.dart';

Widget rowOfRegisterByGoogleAndFacebook({BuildContext? context}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Flexible(
        flex: 5,
        child: myMediaButton(
            onPressed: () {},
            title: "gmail",
            imagePath: "assets/images/Google__G__Logo.svg",
            context: context!),
      ),
      Flexible(flex: 2, child: SizedBox()),
      Flexible(
        flex: 5,
        child: myMediaButton(
            onPressed: () {},
            title: "facebook",
            imagePath: "assets/images/facebook.svg",
            context: context),
      ),
    ],
  );
}
