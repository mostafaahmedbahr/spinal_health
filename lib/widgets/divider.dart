import 'package:flutter/material.dart';
import '../core/colors.dart';

class CustomDividerWidget extends StatelessWidget {
  const CustomDividerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:   EdgeInsets.symmetric(vertical: 10),
      child: Divider(
        height: 2,
        color: AppColors.grey2Color,
      ),
    );
  }
}
