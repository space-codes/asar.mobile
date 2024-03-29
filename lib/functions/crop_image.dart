import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../constants/colors.dart';
import '../screens/result_screen.dart';
import '../utils/navigation_funs.dart';

cropImage(
    {String? filePath,
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
              toolbarTitle: "أثار",
              toolbarColor: mainColor,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              hideBottomControls: true,
              lockAspectRatio: false),
          iosUiSettings: IOSUiSettings(
            title: 'أثار',
          ))
      .then((imageAsFile) async {
    normalShift(
        context!,
        ResultScreen(
          image: imageAsFile,
        ));

    // await ApiProvider().predict(image: imageAsFile!).then((response) {
    //   normalShift(
    //       context!,
    //       ResultScreen(
    //         image: imageAsFile,
    //         result: response.message.toString(),
    //       ));
    // });

    return null;
  });
  if (croppedFile != null) {
    imageFile = croppedFile as XFile;
    function;
  }

  return croppedFile;
}
