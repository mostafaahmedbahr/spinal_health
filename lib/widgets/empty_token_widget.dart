 import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../core/app_colors/colors.dart';
import '../core/utils/constants/constant.dart';
import '../core/utils/nav.dart';

import 'custom_button.dart';
import 'custom_sized_box.dart';
import 'custom_text.dart';

class EmptyTokenWidget extends StatelessWidget {
  const EmptyTokenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "logoImage",
            height: 170,
            width: 150,
            fit: BoxFit.cover,
          ),
          const CustomSizedBox(
            height: 40,
          ),
          CustomButton(
            width: double.infinity,
            borderColor: AppColors.mainColor,
            height: 50,
            btnColor: AppColors.mainColor,
            btnText: CustomText(
              text:" LocaleKeys.login.tr()",
            ),
            onPressed: (){
              // AppNav.customNavigator(
              //   context: context,
              //   screen: const LoginScreen(),
              //   finish: true,
              // );
            },
          ),
        ],
      ),
    );
  }
}
