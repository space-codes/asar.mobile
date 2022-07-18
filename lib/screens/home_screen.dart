import 'package:asar_app/constants/colors.dart';
import 'package:asar_app/constants/strings.dart';
import 'package:asar_app/data/api_provider/api_provider.dart';
import 'package:asar_app/data/models/home_response.dart';
import 'package:asar_app/data/models/language_model.dart';
import 'package:asar_app/screens/login_screen.dart';
import 'package:asar_app/utils/adaptive_text_size.dart';
import 'package:asar_app/utils/navigation_funs.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    setState(() {});
    _getHomeData();
    super.initState();
    setState(() {});
  }

  Future<HomeResponse> _getHomeData() async {
    return await ApiProvider().home();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Material(
      child: Scaffold(
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
              IconButton(
                  onPressed: () async {
                    shiftByReplacement(context, LoginScreen());
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          duration: Duration(seconds: 2),
                          content: Text(
                            "logout".tr(),
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: mainColor),
                    );
                    // await ApiProvider().logout().then((value){
                    //   shiftByReplacement(context, LoginScreen());
                    // });
                  },
                  icon: Icon(
                    Icons.logout,
                    color: Colors.red,
                  ))
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
                        showMyBottomSheet(
                            context: context, width: width, height: height);
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
                FutureBuilder<HomeResponse>(
                  future: _getHomeData(), // async work
                  builder: (BuildContext context,
                      AsyncSnapshot<HomeResponse> snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return Expanded(
                          child: Center(
                            child: CircularProgressIndicator(
                              color: mainColor,
                            ),
                          ),
                        );
                      default:
                        if (snapshot.hasError) {
                          return Expanded(
                            child: Center(
                              child: Text("no_elements".tr(),
                                  style: TextStyle(fontSize: 25)),
                            ),
                          );
                        } else if (snapshot.data!.results!.length != 0)
                          return Expanded(
                              child: ListView.builder(
                                  itemCount: snapshot.data!.results!.length,
                                  itemBuilder: (context, index) {
                                    debugPrint("------------------------> " +
                                        snapshot.data!.results!.length
                                            .toString());
                                    var result = snapshot.data!.results![index];

                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          normalShift(
                                              context,
                                              DetailsScreen(
                                                imagePath: result.image,
                                                text: result.result,
                                              ));
                                        },
                                        child: ConstrainedBox(
                                          constraints: BoxConstraints(
                                              minHeight: 100, maxHeight: 120),
                                          child: Container(
                                            child: Center(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Flexible(
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                                image:
                                                                    DecorationImage(
                                                                        image:
                                                                            NetworkImage(
                                                                          "$homeUrl${result.image!}",
                                                                        ),
                                                                        fit: BoxFit
                                                                            .cover),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)),
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
                                                          result.result!,
                                                          style: TextStyle(
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              color:
                                                                  Colors.black,
                                                              fontSize: adaptiveTextSize
                                                                  .getAdaptiveTextSize(
                                                                      15,
                                                                      context)),
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
                                                borderRadius:
                                                    BorderRadius.circular(10),
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
                                  }));
                        else
                          return Expanded(
                            child: Center(
                              child: Text("no_elements".tr(),
                                  style: TextStyle(fontSize: 25)),
                            ),
                          );
                    }
                  },
                ),
              ],
            ),
          )),
    );
  }
}
