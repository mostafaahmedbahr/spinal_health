
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:spinal_health/core/app_colors/colors.dart';
import 'package:spinal_health/screens/layout/layout_screen.dart';
import 'package:spinal_health/screens/login/login_screen.dart';
import 'package:spinal_health/screens/splash/splash_screen.dart';

import '../../../core/app_images/app_images.dart';
import '../../../core/app_padding/app_padding.dart';
import '../../../core/utils/constants/constant.dart';
import '../../../core/utils/nav.dart';
import '../../../dio/sh/sh.dart';
import '../../../lang/locale_keys.dart';
import '../../../widgets/cutom_app_bar.dart';
import 'components/lang_item.dart';


class ChangeLangScreen extends StatelessWidget {
  const ChangeLangScreen ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
          appBar: CustomAppBar(
            title: LocaleKeys.lang.tr(),
            color: AppColors.blackColor,
          ),
          body: Padding(
            padding:   const EdgeInsets.all(AppPadding.p20),
            child: Column(
              children: [
                CustomLangItem(
                  onTap: ()   {
                    final easyLocalization = EasyLocalization.of(context);
                    if (easyLocalization != null) {
                      context.setLocale(const Locale("ar", ""));
                      SharedPreferencesHelper.saveData(key: "lang", value: "ar");
                      lang = SharedPreferencesHelper.getData(key: "lang");
                      debugPrint(SharedPreferencesHelper.getData(key: "lang"));
                      debugPrint (lang);
                      AppNav.customNavigator(
                        context: context,
                        screen: const SplashScreen(),
                        finish: true,
                      );
                    }
                  },
                  languageImage: AppImages.arabia,
                  languageName: LocaleKeys.arabicLang.tr(),
                ),
                CustomLangItem(
                  onTap: ()   {
                    final easyLocalization = EasyLocalization.of(context);
                    if (easyLocalization != null) {
                      context.setLocale(const Locale("en", ""));
                      SharedPreferencesHelper.saveData(key: "lang", value: "en");
                      lang = SharedPreferencesHelper.getData(key: "lang");
                      debugPrint(SharedPreferencesHelper.getData(key: "lang"));
                      debugPrint (lang);
                    //  LayoutCubit.pageIndex = 1;
                      AppNav.customNavigator(
                        context: context,
                        screen: const SplashScreen(),
                        finish: true,
                      );

                    }
                  },
                  languageImage: AppImages.english,
                  languageName: LocaleKeys.englishLang.tr(),
                ),
              ],
            ),
          ),
        ));
  }
}
