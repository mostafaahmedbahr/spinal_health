 import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:page_transition/page_transition.dart';
import 'package:spinal_health/core/app_images/app_images.dart';
import 'package:spinal_health/core/colors.dart';
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
      const ContentConfig(
        styleTitle: TextStyle(
          color: AppColors.blueColor,
        ),
        styleDescription: TextStyle(
            color: AppColors.blackColor
        ),
        title: "RULER",
        description:
        "Much evil soon high in hope do view. Out may few northward believing attempted. Yet timed being songs marry one defer men our. Although finished blessing do of",
        pathImage: "assets/images/270.jpg",
        backgroundColor:  AppColors.whiteColor,
      ),
    );

    listContentConfig.add(
      const ContentConfig(
        title: "ERASER",
        styleTitle: TextStyle(
          color: AppColors.mainColor,
        ),
        styleDescription: TextStyle(
            color: AppColors.blackColor
        ),
        description: "Allow miles wound place the leave had. To sitting subject no improve studied limited",

        pathImage: "assets/images/1911.i305.025.S.m005.c10.realistic spine scoliosis set-01.jpg",
        backgroundColor:  AppColors.whiteColor,
      ),
    );

    listContentConfig.add(
      const ContentConfig(
        styleTitle: TextStyle(
          color: AppColors.mainColor,
        ),
        styleDescription: TextStyle(
            color: AppColors.blackColor
        ),
        title: "PENCIL",
        description:
        "Ye indulgence unreserved connection alteration appearance",
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
