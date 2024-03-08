 import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:spinal_health/core/app_colors/colors.dart';
import 'package:transformable_list_view/transformable_list_view.dart';

import '../patient_details/patient_details_screen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key, required this.title});
 final String title;
  Matrix4 getTransformMatrix(TransformableListItem item) {
    /// final scale of child when the animation is completed
    const endScaleBound = 0.3;

    /// 0 when animation completed and [scale] == [endScaleBound]
    /// 1 when animation starts and [scale] == 1
    final animationProgress = item.visibleExtent / item.size.height;

    /// result matrix
    final paintTransform = Matrix4.identity();

    /// animate only if item is on edge
    if (item.position != TransformableListItemPosition.middle) {
      final scale = endScaleBound + ((1 - endScaleBound) * animationProgress);

      paintTransform
        ..translate(item.size.width / 2)
        ..scale(scale)
        ..translate(-item.size.width / 2);
    }

    return paintTransform;
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TransformableListView.builder(
          getTransformMatrix: getTransformMatrix,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: (){
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.fade,
                        child:   PatientDetailsScreen ()));

              },
              child: Container(
                height: 150,
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color:  AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: 128.0,
                        height: 128.0,
                        clipBehavior: Clip.antiAlias,
                        decoration:   BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset(
                          'assets/images/happy-successful-muslim-businesswoman-posing-outside.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                   const Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       Text("Aya Bahr",
                         style: TextStyle(
                           fontWeight: FontWeight.bold,
                           fontSize: 18,
                           color: AppColors.whiteColor,
                         ),),
                       Text("21 Years Old",
                         style: TextStyle(
                           fontSize: 16,
                           color: AppColors.whiteColor,
                         ),),
                       Text("Condition description",
                         style: TextStyle(

                           fontSize: 16,
                           color: AppColors.whiteColor,
                         ),),
                     ],
                   ),

                  ],
                ),
              ),
            );
          },
          itemCount: 10,
        ),
      ),
    ));
  }
}
