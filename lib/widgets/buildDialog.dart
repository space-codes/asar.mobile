import 'package:flutter/material.dart';

Future<void> showMyDialog(BuildContext context, String? imagePath,) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.7,
          width: MediaQuery.of(context).size.width * 0.7,
          color: Colors.transparent,
          child:Image.network(imagePath!, fit: BoxFit.fill)
        ),
      );
    },
  );
}
