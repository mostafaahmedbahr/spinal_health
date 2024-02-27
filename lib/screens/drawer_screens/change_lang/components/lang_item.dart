import 'package:flutter/material.dart';

import '../../../../widgets/custom_sized_box.dart';
import '../../../../widgets/custom_text.dart';



//ignore: must_be_immutable
class CustomLangItem extends StatelessWidget {
  CustomLangItem({Key? key,
    required this.languageName,
    required this.languageImage,
    required this.onTap,

  }) : super(key: key);
  final String languageName;
  final String languageImage;
  void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap:onTap,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Image.asset(languageImage,
              height: 60,
              width: 60,
            ),
            const CustomSizedBox(width: 30,),
            CustomText(text: languageName,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ],
        ),
      ),
    );
  }
}
