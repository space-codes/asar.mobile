import 'dart:io';

import 'package:asar_app/constants/colors.dart';
import 'package:asar_app/data/models/default_response.dart';
import 'package:flutter/material.dart';

import '../data/api_provider/api_provider.dart';
import '../utils/adaptive_text_size.dart';
import '../widgets/my_back_button.dart';

class ResultScreen extends StatefulWidget {
  final File? image;

  ResultScreen({Key? key, this.image}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  late Future<DefaultResponse> prediction_result;

  @override
  void initState() {
    prediction_result = _postPredictData(image: widget.image);
    super.initState();
    setState(() {});
  }

  Future<DefaultResponse> _postPredictData({File? image}) async {
    return await ApiProvider().predict(image: image!);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: backgroundColor,
        body: FutureBuilder<DefaultResponse>(
          future: prediction_result, // async work
          builder:
              (BuildContext context, AsyncSnapshot<DefaultResponse> snapshot) {
            String? msg = snapshot.data?.message ?? 'Loading...';
            msg = msg.replaceAll('<br>', '\n').toString();
            print("////////////////" + msg);

            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Column(
                  children: [
                    buildStackOfImage(height, context, width),
                    Expanded(
                      child: Center(
                        child: CircularProgressIndicator(
                          color: mainColor,
                        ),
                      ),
                    ),
                  ],
                );
              case ConnectionState.done:
                return Column(
                  children: [
                    buildStackOfImage(height, context, width),
                    Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.035,
                          right: width * 0.035,
                          top: height * 0.035,
                          bottom: height * 0.035),
                      child: SingleChildScrollView(
                        child: Container(
                          color: Colors.transparent,
                          child: SelectableText(
                            msg,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: adaptiveTextSize.getAdaptiveTextSize(
                                    17, context)),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              default:
                return Column(
                  children: [
                    buildStackOfImage(height, context, width),
                    Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.035,
                          right: width * 0.035,
                          top: height * 0.035,
                          bottom: height * 0.035),
                      child: SingleChildScrollView(
                        child: Container(
                          color: Colors.transparent,
                          child: SelectableText(
                            msg,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: adaptiveTextSize.getAdaptiveTextSize(
                                    17, context)),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
            }
          },
        )
        // body: widget.result != "response"
        //     ? Column(
        //         children: [
        //           Stack(
        //             children: [
        //               Container(
        //                 width: double.infinity,
        //                 height: height * 0.35,
        //                 child: Image.file(widget.image!),
        //               ),
        //               Positioned(
        //                   left:
        //                       Localizations.localeOf(context).languageCode == "ar"
        //                           ? null
        //                           : 15,
        //                   right:
        //                       Localizations.localeOf(context).languageCode == "ar"
        //                           ? 15
        //                           : null,
        //                   top: 10,
        //                   child: myBackButton(
        //                     height: height,
        //                     width: width,
        //                     context: context,
        //                   ))
        //             ],
        //           ),
        //           Expanded(
        //             child: Padding(
        //               padding: EdgeInsets.only(
        //                   left: width * 0.035,
        //                   right: width * 0.035,
        //                   top: height * 0.035,
        //                   bottom: height * 0.035),
        //               child: SingleChildScrollView(
        //                 child: Container(
        //                   color: Colors.transparent,
        //                   child: SelectableText(
        //                     widget.result!,
        //                     style: TextStyle(
        //                         color: Colors.black,
        //                         fontSize: adaptiveTextSize.getAdaptiveTextSize(
        //                             17, context)),
        //                   ),
        //                 ),
        //               ),
        //             ),
        //           )
        //         ],
        //       )
        //     : Column(
        //         children: [
        //           Stack(
        //             children: [
        //               Container(
        //                 width: double.infinity,
        //                 height: height * 0.35,
        //                 child: Image.file(widget.image!, fit: BoxFit.cover),
        //               ),
        //               Positioned(
        //                   left:
        //                       Localizations.localeOf(context).languageCode == "ar"
        //                           ? null
        //                           : 15,
        //                   right:
        //                       Localizations.localeOf(context).languageCode == "ar"
        //                           ? 15
        //                           : null,
        //                   top: 30,
        //                   child: myBackButton(
        //                     height: height,
        //                     width: width,
        //                     context: context,
        //                   ))
        //             ],
        //           ),
        //           Expanded(
        //             child: Center(
        //               child: CircularProgressIndicator(
        //                 color: mainColor,
        //               ),
        //             ),
        //           ),
        //         ],
        //       ),
        );
  }

  Stack buildStackOfImage(double height, BuildContext context, double width) {
    return Stack(
      children: [
        GestureDetector(
          onTap: (){
            showMyDialog(context , widget.image!,);
          },
          child: Container(
            width: double.infinity,
            height: height * 0.35,
            child: Image.file(widget.image!, fit: BoxFit.cover),
          ),
        ),
        Positioned(
            left: Localizations.localeOf(context).languageCode == "ar"
                ? null
                : 15,
            right: Localizations.localeOf(context).languageCode == "ar"
                ? 15
                : null,
            top: 35,
            child: myBackButton(
              height: height,
              width: width,
              context: context,
            ))
      ],
    );
  }

  Future<void> showMyDialog(BuildContext context, File? imagePath,) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width * 0.7,
              color: Colors.transparent,
              child:Image.file(imagePath!, fit: BoxFit.fill)
          ),
        );
      },
    );
  }
}
