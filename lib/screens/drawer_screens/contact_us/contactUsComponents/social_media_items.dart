import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/nav.dart';


class SocialMediaItems extends StatelessWidget {
  const SocialMediaItems({Key? key, required this.twitterUrl, required this.instagramUrl, required this.snapShotUrl, required this.whatsappUrl}) : super(key: key);

  final String twitterUrl;
  final String instagramUrl;
  final String snapShotUrl;
  final String whatsappUrl;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          InkWell(
              onTap: (){
                // AppNav.customNavigator(
                //     context: context,
                //     screen: MyWebsite(
                //       url:twitterUrl,
                //     ),
                //     finish: false,
                // );
              },
              child: SvgPicture.asset("AppImages.twitter")),
          // InkWell(
          //     onTap: (){
          //       // AppNav.customNavigator(
          //       //   context: context,
          //       //   screen: MyWebsite(
          //       //     url: whatsappUrl,
          //       //   ),
          //       //   finish: false,
          //       // );
          //     },
          //     child: SvgPicture.asset(AppImages.whatsApp)),
          // InkWell(
          //     onTap: (){
          //       AppNav.customNavigator(
          //         context: context,
          //         screen: MyWebsite(
          //           url: snapShotUrl,
          //         ),
          //         finish: false,
          //       );
          //     },
          //     child: SvgPicture.asset(AppImages.snapTube)),
          // InkWell(
          //     onTap: (){
          //       AppNav.customNavigator(
          //         context: context,
          //         screen: MyWebsite(
          //           url: instagramUrl,
          //         ),
          //         finish: false,
          //       );
          //     },
          //     child: SvgPicture.asset(AppImages.instegram)),

        ],
      ),
    );
  }
}
