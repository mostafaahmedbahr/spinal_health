 import 'package:flutter/material.dart';

import '../core/colors.dart';
 import 'custom_text.dart';

 //ignore: must_be_immutable
class ButtonInBottom extends StatelessWidget {
    ButtonInBottom({Key? key, required this.onTap, required this.title}) : super(key: key);
  final String title;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.mainColor,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 60,
        width: double.infinity,
        child: Center(
          child: CustomText(
            text: title,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            textColor: AppColors.whiteColor,
          ),
        ),
      ),
    );
  }
}
