import 'package:flutter/material.dart';

import '../core/colors.dart';
import 'custom_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actionList;
  final Widget? leading;
  final Color? backgroundColor;
  final Color? color;

  const CustomAppBar({Key? key,
    required this.title,
    this.leading,
    this.actionList, this.backgroundColor, this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(preferredSize: const Size.fromHeight(60), child:  AppBar(
      backgroundColor: backgroundColor ?? AppColors.mainColor,
      centerTitle: true,
      elevation: 0,
      leading: leading,
      title: CustomText(
        text: title,
        fontSize: 20,
        textColor:color ?? AppColors.whiteColor,
      ),
      actions:actionList,
    ));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>  const Size.fromHeight(60);
}
