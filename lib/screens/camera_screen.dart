import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

import '../utils/navigation_funs.dart';
import 'image_screen.dart';

class Camera extends StatefulWidget {
  const Camera({Key? key}) : super(key: key);

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {

  final ImagePicker _picker = ImagePicker();
  List<XFile>? _imageFileList;

  set _imageFile(XFile? value) {
    _imageFileList = value == null ? null : <XFile>[value];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () async {
              final XFile? image = await _picker.pickImage(source: ImageSource.camera);
              _imageFile = image;
              normalShift(context, ImageScreen(image: image,));
            }, child: const Text("Camera")),
            ElevatedButton(onPressed: () async {
              final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
              normalShift(context, ImageScreen(image: image,));
            }, child: const Text("Gallery")),
          ],
        ),
      ),
    );
  }
}
