import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../functions/crop_image.dart';

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
                        // Navigator.pop(context);
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

