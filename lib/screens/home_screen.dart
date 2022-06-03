import 'package:asar_app/constants/colors.dart';
import 'package:asar_app/data/models/language_model.dart';
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
  List<String> paths = [
    "assets/images/1.jpeg",
    "assets/images/2.jpeg",
    "assets/images/3.jpeg",
    "assets/images/4.jpeg",
    "assets/images/5.jpeg"
  ];

  List<String> texts = [
    "اليوم الاخر و الملئكة و الكتا ب و النبيين و ءتى الما ل على حبه ذوى القربى و اليتا مى و المسا كين و ابن السبيل و السا ئلين وفى الرقاب و افام الصلوة و اتى الزكوة و الموفوت بعهدهم اذا عاهد وا و الصا برين في البا سا ء والضر اء وحين البا س اولئك الذين صدقو ا واولئك هم",
    "من الصفا ت التى طرحت موفاتا كالركب ا دلفر و السبب العطا ء التا م و اليم البحر العرم من عر ا م الجيش  بالضم وهو كثرتر يعنى كم  اجبت دعونه الله وأر اد بالد عو ة الضيا فة عام القحط حتى شا نه فى البياض عرة الفرس فى لايام المظلمة وهه الا زمنة التى و قع القحط",
    "انعمت عليكم و أنى فضلتكم على العا لمين  و اتقو ا يومالاتجزى نفس عن نفس شيئا ولا يقبل منها عذل ولا تنفعها شفا عة ولاهم ينصر ون و ا ذ ابتلى ء برهيم ربه بكلما ت فاتمهن قال اني جا علك للنا س اماماقال ومن ذ ريتى قال لا ينا ل عهدى الظا لمين",
    "وا ركعى مع الرا كعين ء ذلك من انبا الغيب نوخيه اليك و ما كنت لديهم ا ذ يلقون أ قلا مهم أ يهم يكفل مر يم وما كنت لديهم ا ذ يختصمو ا ذ فالت  الملئكة ا مريم  ان الله يبشرك ه بكلمة منه اسمه المسيح عيسى بنن مريم",
    "وهومعه جملة اسمية لامحل لها عطف على احدهما فهو ايضا يعمل عمل فعله تذكرما قلنا فى امثا له نحومعلوم يحب الله تعا اعطا ءله عبده فقير د زهما من مر اد  لفظه مجر و ر تقد ير ا مضا  اليه لنحو و اذا  ا زيد المعنى فيحب فعل مضا رع مرفوغ لفظا بعل معنوى وللجلا لة مر فو عه لفظا فاعله وهومعه جملة فعلية لامحل لها ابتدئية وا عطا ء منصوب لفظا مفعول به ليحب و اللا م خرف جر متعلق باعطا ء والضمير المجر و ر مبنى على الضم فمحله القريب مجرو ر باللا م  ؤمحله البعيد منصوب مفعول له",

  ];

  @override
  void initState() {
    super.initState();
    setState(() {});
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
                Expanded(
                    child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                normalShift(
                                    context,
                                    DetailsScreen(
                                      imagePath: paths[index],
                                      text: texts[index],
                                    ));
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
                                                        paths[index],
                                                      ),
                                                      fit: BoxFit.cover),
                                                  borderRadius:
                                                      BorderRadius.circular(
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
                                                texts[index],
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
          )),
    );
  }
}
