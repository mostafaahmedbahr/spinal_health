import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:spinal_health/core/colors.dart';
import 'package:spinal_health/core/utils/nav.dart';
import 'package:spinal_health/lang/locale_keys.dart';
import 'package:spinal_health/widgets/custom_Loading.dart';

import '../../type_details/type_details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(

        children: [
          SizedBox(
            height: 200,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                    height: 200,
                    imageUrl: "https://img.freepik.com/free-vector/arabic-doctor-with-medical-icon-hand-drawn-sketch-vector-background_460848-15109.jpg?t=st=1709227664~exp=1709231264~hmac=a996896c95fe34f816ebdbe6da8c1f3a8db89b2655064c4345227c8be1f738a0&w=1060",
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            const CustomLoading(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                );
              },
              itemCount: 3,
              viewportFraction: 0.8,
              scale: 0.9,
              pagination: const SwiperPagination(
                  margin: EdgeInsets.all(10.0),
              ),
              autoplay: true,
            ),
            // child: Swiper(
            //   itemBuilder: (BuildContext context,int index){
            //     return CachedNetworkImage(
            //       imageUrl: "http://via.placeholder.com/350x150",
            //       progressIndicatorBuilder: (context, url, downloadProgress) =>
            //         const   CustomLoading(),
            //       errorWidget: (context, url, error) => const Icon(Icons.error),
            //     );
            //   },
            //   itemCount: 3,
            //   pagination: const SwiperPagination(),
            //   control: const SwiperControl(),
            // ),
          ),
          const SizedBox(height: 10,),
          Text(LocaleKeys.types.tr(),
          style: const TextStyle(
            fontSize: 22,
            color: AppColors.blueColor,
            fontWeight: FontWeight.bold
          ),),
          const SizedBox(height: 10,),
          SizedBox(
            height: 100,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
                itemBuilder: (context , index){
                  return InkWell(
                    onTap: (){

                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade, child: const  TypeDetailsScreen()));
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
                              child: Image.asset("assets/images/4033.jpg",height: 50,width: 50,)),
                         Text("Type (${index+1})"),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder:  (context , index){
                  return const SizedBox(width: 8,);
                },
                itemCount: 10,
            ),
          ),
          const SizedBox(height: 20,),
          Text(LocaleKeys.categories.tr(),
            style: const TextStyle(
                fontSize: 22,
                color: AppColors.blueColor,
                fontWeight: FontWeight.bold
            ),),
          const SizedBox(height: 20,),
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
          ),
          const SizedBox(height: 10,),
        ],
      ),
    );
  }
}
