 import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:page_transition/page_transition.dart';
 import 'package:spinal_health/core/colors.dart';
import 'package:spinal_health/lang/locale_keys.dart';
import 'package:spinal_health/screens/login/login_screen.dart';
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  List<ContentConfig> listContentConfig = [];

  @override
  void initState() {
    super.initState();


    listContentConfig.add(
        ContentConfig(
        styleTitle: const TextStyle(
          color: AppColors.blueColor,
        ),
        styleDescription: const TextStyle(
            color: AppColors.blackColor
        ),
        title: LocaleKeys.onBoarding1Title.tr(),
        description: LocaleKeys.onBoarding1.tr(),
        pathImage: "assets/images/270.jpg",
        backgroundColor:  AppColors.whiteColor,
      ),
    );

    listContentConfig.add(
       ContentConfig(
         title: LocaleKeys.onBoarding2Title.tr(),
        styleTitle:const TextStyle(
          color: AppColors.blueColor,
        ),
        styleDescription: const TextStyle(
            color: AppColors.blackColor
        ),
        description:  LocaleKeys.onBoarding2.tr(),
        pathImage: "assets/images/1911.i305.025.S.m005.c10.realistic spine scoliosis set-01.jpg",
        backgroundColor:  AppColors.whiteColor,
      ),
    );

    listContentConfig.add(
        ContentConfig(
        styleTitle: const TextStyle(
          color: AppColors.blueColor,
        ),
        styleDescription:const  TextStyle(
            color: AppColors.blackColor
        ),
          title: LocaleKeys.onBoarding3Title.tr(),
          description:  LocaleKeys.onBoarding3.tr(),
        pathImage:  "assets/images/tiqs_nfas_220720.jpg",
        backgroundColor:  AppColors.whiteColor,
      ),
    );
  }

  void onDonePress() {
    log("End of slides");
    Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: const LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: IntroSlider(
        key: UniqueKey(),
        listContentConfig: listContentConfig,
        doneButtonStyle: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColors.mainColor),
        ),
        onDonePress: onDonePress,
        nextButtonStyle:ButtonStyle(
          foregroundColor:MaterialStateProperty.all(
              AppColors.primaryColor),
        ) ,
      ),
    );
  }
}
