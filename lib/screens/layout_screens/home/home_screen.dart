import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'package:spinal_health/core/colors.dart';
import 'package:spinal_health/core/utils/nav.dart';
import 'package:spinal_health/dio/sh/sh.dart';
 import 'package:spinal_health/lang/locale_keys.dart';
import 'package:spinal_health/screens/layout_screens/home/home_cubit/home_cubit.dart';
import 'package:spinal_health/screens/layout_screens/home/home_cubit/home_states.dart';
import 'package:spinal_health/screens/patient_details/patient_details_screen.dart';
import 'package:spinal_health/widgets/custom_Loading.dart';

import '../../../widgets/shimmer_loading.dart';
import '../../category/category_screen.dart';
import '../../type_details/type_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    _startLoadingTimer();
  }
  void _startLoadingTimer() {
    Timer(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    print(SharedPreferencesHelper.getData(key: "userType"));
    SharedPreferencesHelper.getData(key: "userType");
    print(SharedPreferencesHelper.getData(key: "userType"));
    return BlocConsumer<HomeCubit , HomeStates>(
      listener: (context , state ){},
    builder: (context , state ){
        return  Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              BlocConsumer<HomeCubit , HomeStates>(
                listener: (context , state ){},
                builder: (context , state ){
                  var homeCubit = HomeCubit.get(context);
                  if (homeCubit.sliderImagesList.isEmpty) {
                    return const SimmerLoading(
                      height: 200,
                      width: double.infinity,
                      raduis: 10,
                    );
                  }
                  return SizedBox(
                    height: 200,
                    child: Swiper(
                      itemBuilder: (BuildContext context, int index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            width: double.infinity,
                            fit: BoxFit.fitWidth,
                            height: 200,
                            imageUrl: homeCubit.sliderImagesList[index].image,
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) =>
                            const CustomLoading(),
                            errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                          ),
                        );
                      },
                      itemCount: homeCubit.sliderImagesList.length,
                      viewportFraction: 0.8,
                      scale: 0.9,
                      pagination: const SwiperPagination(
                        margin: EdgeInsets.all(10.0),
                      ),
                      autoplay: true,
                    ),
                  );
                },
              ),
              const SizedBox(height: 10,),
              Text(LocaleKeys.types.tr(),
                style: const TextStyle(
                    fontSize: 22,
                    color: AppColors.blueColor,
                    fontWeight: FontWeight.bold
                ),),
              const SizedBox(height: 10,),
              BlocConsumer<HomeCubit , HomeStates>(
                listener: (context , state ){},
                builder: (context , state ){
                  var homeCubit = HomeCubit.get(context);
                  if (homeCubit.typesList.isEmpty) {
                    return SizedBox(
                      height: 100,
                      child: ListView.separated(
                        separatorBuilder:  (context , index){
                          return const SizedBox(width: 8,);
                        },
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context , index)=> const SimmerLoading(
                          height: 100,
                          width: 100,
                          raduis: 10,
                        ),
                      ),
                    );
                  }
                  return SizedBox(
                    height: 100,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context , index){
                        return InkWell(
                          onTap: (){
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.fade,
                                    child:   TypeDetailsScreen(
                                      id: homeCubit.typesList[index].id,
                                      des: homeCubit.typesList[index].description,
                                      image: homeCubit.typesList[index].image,
                                      url: homeCubit.typesList[index].url,
                                      title: homeCubit.typesList[index].title,
                                    )));
                          },
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.primaryColor,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: CachedNetworkImage(
                                    height: 50,width: 50,
                                    fit: BoxFit.fitWidth,
                                    imageUrl: homeCubit.typesList[index].image,
                                    progressIndicatorBuilder:
                                        (context, url, downloadProgress) =>
                                    const CustomLoading(),
                                    errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                                  ),
                                ),
                                Text(homeCubit.typesList[index].title),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder:  (context , index){
                        return const SizedBox(width: 8,);
                      },
                      itemCount: homeCubit.typesList.length,
                    ),
                  );
                },

              ),
              const SizedBox(height: 20,),
             !isLoading ?
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SharedPreferencesHelper.getData(key: "userType") =="Doctor" ?
                  Text(LocaleKeys.categories.tr(),
                    style: const TextStyle(
                        fontSize: 22,
                        color: AppColors.blueColor,
                        fontWeight: FontWeight.bold
                    ),) :
                  Text(LocaleKeys.myDetails.tr(),
                    style: const TextStyle(
                        fontSize: 22,
                        color: AppColors.blueColor,
                        fontWeight: FontWeight.bold
                    ),),
                  const SizedBox(height: 20,),
                  SharedPreferencesHelper.getData(key: "userType") =="Doctor" ?
                  GridView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Number of items per row
                      mainAxisSpacing: 10.0, // Spacing between rows
                      crossAxisSpacing: 10.0, // Spacing between columns
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {

                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.fade, child:     CategoryScreen(
                                title: "Category (${index+1})",
                              )));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),

                              border: Border.all(
                                  color: AppColors.primaryColor
                              )
                          ),
                          child: Stack(
                            alignment : Alignment.topRight,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset("assets/images/4033.jpg",
                                  fit: BoxFit.cover,
                                  height: double.infinity,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text("Category (${index+1})"),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                      :    InkWell(
                    onTap: (){
                      AppNav.customNavigator(context: context,
                        screen: const PatientDetailsScreen(),
                        finish: false,
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.withOpacity(0.2),
                      ),
                      child: Center(
                        child: Text(LocaleKeys.showMyDetails.tr(),
                          style: const TextStyle(
                              fontSize: 22,
                              color: AppColors.blackColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                ],
              ) :
             const CustomLoading(),


            ],
          ),
        );
    }

    );
  }
}
