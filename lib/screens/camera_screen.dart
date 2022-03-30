import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/navigation_funs.dart';
import 'crop_screen.dart';

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
            ElevatedButton(
                onPressed: () async {
                  final XFile? image =
                      await _picker.pickImage(source: ImageSource.camera);
                  _imageFile = image;
                  normalShift(
                      context,
                      CropScreen(
                        image: image,
                      ));
                  print(image!.path.toString());
                  //normalShift(context, ImageScreen(image: image,));
                },
                child: const Text("Camera")),
            ElevatedButton(
                onPressed: () async {
                  final XFile? image =
                      await _picker.pickImage(source: ImageSource.gallery);
                  normalShift(
                      context,
                      CropScreen(
                        image: image,
                      ));
                  //normalShift(context, ImageScreen(image: image,));
                },
                child: const Text("Gallery")),
          ],
        ),
      ),
    );
  }
}
