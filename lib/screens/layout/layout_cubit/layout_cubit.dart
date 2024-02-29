
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spinal_health/lang/locale_keys.dart';

import '../../layout_screens/home/home_screen.dart';
import 'layout_states.dart';


class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutInitState());

  static LayoutCubit get(context) => BlocProvider.of(context);

  static int pageIndex = 1;
  List screens = [
     const HomeScreen(),
    Text("2"),
    Text("3"),
    Text("4"),
    Text("5"),
    // const MoreScreen(),
    // const ProfileScreen(),

    // PhotosScreen(),
    // VideosScreen(),
  ];


  List<String> appBarTitles = [
     LocaleKeys.home.tr(),
     "2" ,
     "3" ,
     "4" ,
     "4" ,

  ];

  changeBottomNav(index , context) {
    pageIndex = index;
    emit(ChangeBottomNavState());
  }


}