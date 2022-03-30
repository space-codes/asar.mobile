import 'package:flutter/material.dart';

import 'button.dart';

showMyBottomSheet({double? width, double? height, BuildContext? context}) {
  showModalBottomSheet(
      elevation: 10,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      backgroundColor: Colors.white,
      context: context!,
      builder: (ctx) => Container(
            width: width,
            height: height! * 0.25,
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ListTile(title: Text("Camera"),leading: Icon(Icons.camera_alt),),
                  ListTile(title: Text("Gallry"),leading: Icon(Icons.image),)
                ],
              ),
            ),
          ));
}
