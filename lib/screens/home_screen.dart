import 'dart:io';

import 'package:asar_app/constants/colors.dart';
import 'package:asar_app/data/models/language_model.dart';
import 'package:asar_app/utils/adaptive_text_size.dart';
import 'package:asar_app/utils/navigation_funs.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/my_bottom_sheet.dart';
import 'details_screen.dart';

String? localLanguageCode;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text("home_title".tr(), style: TextStyle(color: mainColor)),
          actions: <Widget>[
            PopupMenuButton<Language>(
              icon: const Icon(Icons.language, color: mainColor),
              onSelected: (val) {
                setState(() {
                  EasyLocalization.of(context)!.setLocale(Locale(val.code));
                });
              },
              itemBuilder: (BuildContext context) {
                return Language.getListOfLanguages().map((Language language) {
                  return PopupMenuItem<Language>(
                    value: language,
                    child: Text(language.name),
                  );
                }).toList();
              },
            ),
          ],
          leading: SvgPicture.asset("assets/images/logo.svg"),
        ),
        body: Padding(
          padding: EdgeInsets.only(left: width * 0.035, right: width * 0.035),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: 100, maxHeight: 120),
                  child: GestureDetector(
                    onTap: () {
                      showMyBottomSheet(context: context , width: width , height: height);
                    },
                    child: Container(
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add_a_photo, color: Colors.white),
                            SizedBox(
                              width: 11,
                            ),
                            Text(
                              "add_manuscript".tr(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: adaptiveTextSize
                                      .getAdaptiveTextSize(22, context)),
                            ),
                          ],
                        ),
                      ),
                      height: height * 0.19,
                      decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: mainColor.withOpacity(0.5),
                                blurRadius: 4,
                                spreadRadius: 2)
                          ]),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.015,
              ),
              Row(
                children: [
                  Text(
                    "history".tr(),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize:
                            adaptiveTextSize.getAdaptiveTextSize(22, context),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.015,
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                              onTap: (){
                                normalShift(context, DetailsScreen());
                              },
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                  minHeight: 100, maxHeight: 120),
                              child: Container(
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Flexible(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                      "assets/images/manuscript.jpg",
                                                    ),
                                                    fit: BoxFit.cover),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                          ),
                                          flex: 1,
                                        ),
                                        SizedBox(
                                          width: 11,
                                        ),
                                        Flexible(
                                          flex: 2,
                                          child: Container(
                                            child: Text(
                                              "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق. إذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص العربى زيادة عدد الفقرات كما تريد، النص لن يبدو مقسما ولا يحوي أخطاء لغوية، مولد النص العربى مفيد لمصممي المواقع على وجه الخصوص، حيث يحتاج العميل فى كثير من الأحيان أن يطلع على صورة حقيقية لتصميم الموقع.",
                                              style: TextStyle(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  color: Colors.black,
                                                  fontSize: adaptiveTextSize
                                                      .getAdaptiveTextSize(
                                                          15, context)),
                                              maxLines: 5,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                height: height * 0.19,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 3,
                                          spreadRadius: 1)
                                    ]),
                              ),
                            ),
                          ),
                        );
                      }))
            ],
          ),
        ));
  }


}
