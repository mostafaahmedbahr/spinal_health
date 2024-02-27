 import 'package:flutter/material.dart';
 import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
 import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:page_transition/page_transition.dart';
import 'package:spinal_health/core/app_colors/colors.dart';

import '../drawer_screens/about_us/about_us_screen.dart';
import '../drawer_screens/change_lang/change_lang_screen.dart';
import '../drawer_screens/contact_us/contact_us_screen.dart';

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
  final _advancedDrawerController = AdvancedDrawerController();

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.primaryColor, AppColors.mainColor ],
          ),
        ),
      ),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      // openScale: 1.0,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        // NOTICE: Uncomment if you want to add shadow behind the page.
        // Keep in mind that it may cause animation jerks.
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 0.0,
          ),
        ],
        borderRadius:   BorderRadius.all(Radius.circular(16)),
      ),
      drawer: SafeArea(
        child: ListTileTheme(
          textColor: Colors.white,
          iconColor: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 128.0,
                height: 128.0,
                margin: const EdgeInsets.only(
                  top: 24.0,
                  bottom: 64.0,
                ),
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  color: Colors.black26,
                  shape: BoxShape.circle,
                ),
                // child: Image.asset(
                //   'assets/images/flutter_logo.png',
                // ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: const ChangeLangScreen()));
                },
                leading:const Icon(Icons.language),
                title: const Text('Language'),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: const AboutUsScreen()));
                },
                leading: const Icon(Icons.people_alt),
                title: const Text('About Us'),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: const ContactUsScreen()));
                },
                leading: const Icon(Icons.contact_support),
                title: const Text('contact us'),
              ),
              ListTile(
                onTap: () {},
                leading: Icon(Icons.settings),
                title: Text('Settings'),
              ),
              Spacer(),
              DefaultTextStyle(
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white54,
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 16.0,
                  ),
                  child: Text('Terms of Service | Privacy Policy'),
                ),
              ),
            ],
          ),
        ),
      ),
      child: SafeArea(child: Scaffold(
        appBar: AppBar(
          title: const Text('Advanced Drawer Example'),
          leading: IconButton(
            onPressed: _handleMenuButtonPressed,
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: _advancedDrawerController,
              builder: (_, value, __) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child: Icon(
                    value.visible ? Icons.clear : Icons.menu,
                    key: ValueKey<bool>(value.visible),
                  ),
                );
              },
            ),
          ),
        ),
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
      
      )),
    );
  }
}
