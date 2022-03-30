import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
            height: height! * 0.2,
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ListTile(title: Text("camera".tr()),leading: Icon(Icons.camera_alt),
                  onTap: (){
                    ImagePicker().pickImage(source: ImageSource.camera);
                  },
                  ),
                  ListTile(title: Text("gallery".tr()),leading: Icon(Icons.image),onTap: (){
                    ImagePicker().pickImage(source: ImageSource.gallery);
                  },)
                ],
              ),
            ),
          ));
}
