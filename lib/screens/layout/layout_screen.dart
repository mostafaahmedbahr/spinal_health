 import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
 import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
 import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:spinal_health/core/app_colors/colors.dart';
import 'package:spinal_health/lang/locale_keys.dart';
import 'package:spinal_health/screens/layout/layout_cubit/layout_cubit.dart';
import 'package:spinal_health/screens/layout/layout_cubit/layout_states.dart';

import '../../dio/sh/sh.dart';
import '../drawer_screens/about_us/about_us_screen.dart';
import '../drawer_screens/change_lang/change_lang_screen.dart';
import '../drawer_screens/contact_us/contact_us_screen.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {

  static   List<TabItem> items = [
    TabItem(
      icon: Icons.home,
        title: LocaleKeys.home.tr(),
    ),
    // TabItem(
    //   icon: Icons.search_sharp,
    //   title: LocaleKeys.search.tr(),
    // ),
    TabItem(
      icon: Icons.account_box,
      title: LocaleKeys.profile.tr(),
    ),
  ];

  static   List<TabItem> itemsPatient = [
    TabItem(
      icon: Icons.home,
      title: LocaleKeys.home.tr(),
    ),
    TabItem(
      icon: Icons.account_box,
      title: LocaleKeys.profile.tr(),
    ),
  ];

  int visit = 0;
  int visit2 = 0;
  double height = 30;
  final _advancedDrawerController = AdvancedDrawerController();

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }

  @override
  Widget build(BuildContext context) {
    SharedPreferencesHelper.getData(key: "userType");
    return BlocConsumer<LayoutCubit , LayoutStates>(
      listener: (context , state ){},
      builder: (context , state ){
        SharedPreferencesHelper.getData(key: "userType");
        print( SharedPreferencesHelper.getData(key: "userType"));
        print("aaa");
        var layoutCubit = LayoutCubit.get(context);
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
          disabledGestures: false,
          childDecoration: const BoxDecoration(
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
                    title:   Text(LocaleKeys.lang.tr(),),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: const AboutUsScreen()));
                    },
                    leading: const Icon(Icons.people_alt),
                    title:   Text(LocaleKeys.aboutUs.tr(),),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: const ContactUsScreen()));
                    },
                    leading: const Icon(Icons.contact_support),
                    title:   Text(LocaleKeys.contactUs.tr(),),
                  ),
                  // ListTile(
                  //   onTap: () {},
                  //   leading: const Icon(Icons.settings),
                  //   title: const Text('Settings'),
                  // ),
                  const Spacer(),
                  DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white54,
                    ),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 16.0,
                      ),
                      child: const Text('Terms of Service | Privacy Policy'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          child: SafeArea(child: Scaffold(
            appBar: AppBar(
              title:   Text(layoutCubit.appBarTitles[LayoutCubit.pageIndex]),
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
            body:
              SharedPreferencesHelper.getData(key: "userType") =="Doctor" ?
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(child: layoutCubit.screens[LayoutCubit.pageIndex]),
                BottomBarInspiredOutside(
                  items: items,
                  backgroundColor: AppColors.primaryColor,
                  color: AppColors.whiteColor,
                  colorSelected: AppColors.whiteColor,
                  indexSelected: visit,
                  onTap: (int index) => setState(() {
                    visit = index;
                    layoutCubit.changeBottomNav(index , context);
                  }),
                  top: -25,
                  animated: true,
                  itemStyle: ItemStyle.hexagon,
                  chipStyle:const ChipStyle(drawHexagon: true,color: AppColors.mainColor ,background: AppColors.blueColor),
                ),
              ],
            ) :
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                      child: layoutCubit.screensPatient[LayoutCubit.pageIndexForPatient]),
                  BottomBarInspiredOutside(
                    items: itemsPatient,
                    backgroundColor: AppColors.primaryColor,
                    color: AppColors.whiteColor,
                    colorSelected: AppColors.whiteColor,
                    indexSelected: visit2,
                    onTap: (int index) => setState(() {
                      visit2 = index;
                      layoutCubit.changeBottomNavPatient(index , context);
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
      },

    );
  }
}
