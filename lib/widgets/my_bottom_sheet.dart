import 'dart:io';

import 'package:asar_app/constants/colors.dart';
import 'package:asar_app/screens/result_screen.dart';
import 'package:asar_app/utils/navigation_funs.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

showMyBottomSheet({double? width, double? height, BuildContext? context}) {
  showModalBottomSheet(
      elevation: 10,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      backgroundColor: Colors.white,
      context: context!,
      builder: (ctx) {
        return StatefulBuilder(
          builder:
              (BuildContext cxt, void Function(void Function()) setState) {
            return Container(
              width: width,
              height: height! * 0.2,
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ListTile(
                      title: Text("camera".tr()),
                      leading: Icon(Icons.camera_alt),
                      onTap: () {
                        Navigator.pop(context);
                        ImagePicker()
                            .pickImage(source: ImageSource.camera)
                            .then((value) =>
                            cropImage(
                                filePath: value!.path.toString(),
                                function: setState,
                                imageFile: value,
                                context: context));
                      },
                    ),
                    ListTile(
                      title: Text("gallery".tr()),
                      leading: Icon(Icons.image),
                      onTap: () {
                        Navigator.pop(context);
                        ImagePicker()
                            .pickImage(source: ImageSource.gallery)
                            .then((value) =>
                            cropImage(
                                filePath: value!.path.toString(),
                                function: setState,
                                imageFile: value,
                                context: context));
                      },
                    )
                  ],
                ),
              ),
            );
          },
        );
      });
}

cropImage({String? filePath,
  XFile? imageFile,
  Function? function,
  BuildContext? context}) async {
  File? croppedFile = await ImageCropper()
      .cropImage(
      sourcePath: imageFile!.path,
      aspectRatioPresets: Platform.isAndroid
          ? [
        CropAspectRatioPreset.original,
      ]
          : [
        CropAspectRatioPreset.original,
      ],
      androidUiSettings: AndroidUiSettings(
          toolbarTitle: "Medad",
          toolbarColor: mainColor,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          hideBottomControls: true,
          lockAspectRatio: false),
      iosUiSettings: IOSUiSettings(
        title: 'مداد',
      ))
      .then((value) {
    normalShift(
        context!,
        ResultScreen(
          image: value,
        ));
    print("-------------------------------------------------------------------")
    print(value!.path);
    print("-------------------------------------------------------------------")
  });
  if (croppedFile != null) {
    imageFile = croppedFile as XFile;
    function;
  }

  return croppedFile;
}
