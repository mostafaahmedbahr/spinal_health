 import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:transformable_list_view/transformable_list_view.dart';

import '../../../core/app_colors/colors.dart';
import '../../../lang/locale_keys.dart';
import '../../../widgets/cutom_app_bar.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});
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
      appBar: CustomAppBar(
        title: LocaleKeys.aboutUs.tr(),
        color: AppColors.blackColor,
      ),
      body: TransformableListView.builder(
        getTransformMatrix: getTransformMatrix,
        itemBuilder: (context, index) {
          return Container(
            height: 300,
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            decoration: BoxDecoration(
              color: index.isEven ? AppColors.primaryColor.withOpacity(0.1) : const Color(0xffFFBE98).withOpacity(0.5),
              borderRadius: BorderRadius.circular(20),
            ),
            alignment: Alignment.center,
            child: Column(
              children: [
                Container(
                  width: 128.0,
                  height: 128.0,
                  margin: const EdgeInsets.only(
                    top: 24.0,
                    bottom: 12.0,
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    color: Colors.black26,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/images/happy-successful-muslim-businesswoman-posing-outside.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                const Text("Aya Bahr",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                      child: Text("Aya Bahr description"*100,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.grey1Color
                      ),),
                    ),
                  ),
              ],
            ),
          );
        },
        itemCount: 10,
      ),
    ));
  }
}
