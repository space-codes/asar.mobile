import 'package:flutter/material.dart';

// Go and come back
normalShift(BuildContext context, Widget page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

// Go and don't come back
shiftByReplacement(BuildContext context, Widget page) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => page));
}

popShift(BuildContext context) {
  Navigator.maybePop(context);
}
