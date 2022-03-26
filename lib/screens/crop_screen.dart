import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:crop_your_image/crop_your_image.dart';
import 'package:flutter/material.dart';

class CropScreen extends StatefulWidget {
  const CropScreen({Key? key, this.image}) : super(key: key);
  final XFile? image;

  @override
  _CropScreenState createState() => _CropScreenState();
}

class _CropScreenState extends State<CropScreen> {

  final _cropController = null;
  var _isSumbnail = false;
  var _isCropping = false;

  Uint8List? _croppedData;

  @override
  void initState() {
    final _cropController = CropController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.only(left: 16, bottom: 0, right: 16, top: 16),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.transparent,
                child: Stack(
                  children: [
                    Crop(
                      controller: _cropController,
                      image: Uint8List.fromList(widget.image!.path.codeUnits),
                      baseColor: Colors.transparent,
                      onCropped: (croppedData) {
                        setState(() {
                          _croppedData = croppedData;
                          _isCropping = false;
                        });
                      },
                      maskColor: _isSumbnail ? Colors.white : null,
                      interactive: false,
                      fixArea: false,
                    ),
                    Positioned(
                      right: 16,
                      bottom: 16,
                      child: GestureDetector(
                        onTapDown: (_) => setState(() => _isSumbnail = true),
                        onTapUp: (_) => setState(() => _isSumbnail = false),
                        child: CircleAvatar(
                          backgroundColor:
                              _isSumbnail ? Colors.blue.shade50 : Colors.blue,
                          child: const Center(
                            child: Icon(Icons.crop_free_rounded),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (_croppedData == null)
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _isCropping = true;
                          });
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Text('CROP IT!'),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Expanded _buildSumbnail(Uint8List data) {
    return Expanded(
      child: InkWell(
        onTap: () {
          _croppedData = null;
        },
        child: Container(
          height: 200,
          decoration: BoxDecoration(
              border: Border.all(
            width: 8,
            color: Colors.blue,
          )),
          child: Image.memory(
            data,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
