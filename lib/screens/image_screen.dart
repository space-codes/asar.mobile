import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({Key? key, this.image}) : super(key: key);
  final XFile? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.file(File(image!.path)),
      ),
    );
  }


}
