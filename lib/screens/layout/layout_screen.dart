 import 'package:flutter/material.dart';
 import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
 import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:spinal_health/core/app_colors/colors.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  static const List<TabItem> items = [
    TabItem(
      icon: Icons.home,
        title: 'Home',
    ),
    TabItem(
      icon: Icons.search_sharp,
      title: 'Shop',
    ),
    TabItem(
      icon: Icons.favorite_border,
      title: 'Wishlist',
    ),
    TabItem(
      icon: Icons.shopping_cart_outlined,
      title: 'Cart',
    ),
    TabItem(
      icon: Icons.account_box,
      title: 'profile',
    ),
  ];

  int visit = 0;
  double height = 30;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          BottomBarInspiredOutside(
            items: items,
            backgroundColor: AppColors.primaryColor,
            color: AppColors.whiteColor,
            colorSelected: AppColors.whiteColor,
            indexSelected: visit,
            onTap: (int index) => setState(() {
              visit = index;
            }),
            top: -25,
            animated: true,
            itemStyle: ItemStyle.hexagon,
            chipStyle:const ChipStyle(drawHexagon: true,color: AppColors.mainColor ,background: AppColors.blueColor),
          ),



        ],
      ),

    ));
  }
}
