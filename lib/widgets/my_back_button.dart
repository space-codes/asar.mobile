
import 'package:flutter/material.dart';

Widget myBackButton({BuildContext? context, double? width, double? height}) {
  return GestureDetector(
    onTap: () {
      // Navigator.pushAndRemoveUntil(
      //   context!,
      //   MaterialPageRoute(builder: (context) => HomeScreen()),
      //       (Route<dynamic> route) => false,
      // );
      Navigator.pop(context! , true);
      //popShift(context!);
    },
    child: Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10) , color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: Icon(Icons.arrow_back_ios_sharp)),
      ),
    ),
  );
}
