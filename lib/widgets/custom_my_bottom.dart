import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/colors.dart';



class CustomMyBottom extends StatelessWidget {
  final String text;
  final double? width;
  final double? height;
  final VoidCallback onTap;
  const CustomMyBottom({Key? key,
  required this.text,
  this.width,this.height,
  required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: AppColors.mainColor,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
                color: AppColors.mainColor
            )
        ),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child:width==double.infinity?Center(child: Text(text,style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white

          ),)): Text(text,style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white

          ),),
        ),),
    );
  }
}
