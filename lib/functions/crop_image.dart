import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../constants/colors.dart';
import '../screens/result_screen.dart';
import '../utils/navigation_funs.dart';

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
          toolbarTitle: "مداد",
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
    return null;
  });
  if (croppedFile != null) {
    imageFile = croppedFile as XFile;
    function;
  }

  return croppedFile;
}