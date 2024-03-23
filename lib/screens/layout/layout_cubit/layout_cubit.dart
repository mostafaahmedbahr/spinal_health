
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spinal_health/lang/locale_keys.dart';

import '../../../dio/sh/sh.dart';
import '../../layout_screens/home/home_screen.dart';
import '../../layout_screens/profile/profile_screen.dart';
import '../../layout_screens/search/search_screen.dart';
import 'layout_states.dart';


class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutInitState());

  static LayoutCubit get(context) => BlocProvider.of(context);

  static int pageIndex = 0;
  List screens = [
     const HomeScreen(),
    const SearchScreen(),
    const ProfileScreen(),


  ];


  List<String> appBarTitles = [
     LocaleKeys.home.tr(),
    LocaleKeys.search.tr(),
    LocaleKeys.profile.tr(),

  ];

  changeBottomNav(index , context) {
    pageIndex = index;
    emit(ChangeBottomNavState());
  }




  static int pageIndexForPatient = 0;
  List screensPatient = [
    const HomeScreen(),
    const ProfileScreen(),
  ];


  List<String> appBarTitlesPatient = [
    LocaleKeys.home.tr(),
    LocaleKeys.profile.tr(),

  ];

  changeBottomNavPatient(index , context) {
    pageIndexForPatient = index;
    emit(ChangeBottomNavState2());
  }

}