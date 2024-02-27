import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:spinal_health/screens/layout/layout_screen.dart';
import 'package:spinal_health/screens/splash/splash_screen.dart';

import '../../../core/colors.dart';
import '../../../lang/locale_keys.dart';
import '../../../widgets/custom_Loading.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_sized_box.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/custom_text_form_filed.dart';
import '../../core/app_images/app_images.dart';
import '../../core/app_validator/app_validator.dart';
import 'login_cubit/login_cubit.dart';
import 'login_cubit/login_states.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var loginCubit = LoginCubit.get(context);
        return SafeArea(
          child: Scaffold(
            body: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const CustomSizedBox(
                        height: 50,
                      ),
                      Image.asset(
                        AppImages.logo,
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      const CustomSizedBox(
                        height: 20,
                      ),
                      CustomText(
                        text: LocaleKeys.login.tr(),
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        textColor: AppColors.blackColor,
                      ),
                      const CustomSizedBox(
                        height: 40,
                      ),
                     /// رقم التلفون
                      CustomTextFormField(
                        controller: loginCubit.emailCon,
                        keyboardType: TextInputType.emailAddress,
                        validator: (String? value) {
                          MyValidators.emailValidator(value);

                        },
                        hintText: LocaleKeys.email.tr(),
                      ),
                      const CustomSizedBox(
                        height: 18,
                      ),
                      /// الباسورد
                      CustomTextFormField(
                        obscureText: loginCubit.isVisible,
                        controller: loginCubit.passCon,
                        keyboardType: TextInputType.visiblePassword,
                        validator: (String? value) {
                          MyValidators.passwordValidator(value);

                        },
                        icon: IconButton(
                          color: AppColors.grey1Color,
                          icon: loginCubit.isVisible
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility),
                          onPressed: () {
                            loginCubit.changeSuffixIcon();
                          },
                        ),
                        hintText: LocaleKeys.password.tr(),
                      ),
                      const CustomSizedBox(
                        height: 30,
                      ),
                      ConditionalBuilder(
                        condition: state is! LoginLoadingState,
                        fallback: (context) {
                          return const CustomLoading();
                        },
                        builder: (context) {
                          return CustomButton(
                            height: 60,
                            width: double.infinity,
                            btnColor: AppColors.thirdMainColor,
                            borderColor:  AppColors.thirdMainColor,
                            btnText: CustomText(
                              text: LocaleKeys.login.tr(),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              textColor: AppColors.whiteColor,
                            ),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                print("object");
                                Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: const LayoutScreen()));
                                // loginCubit.login(
                                //   mobile: loginCubit.mobileCon.text,
                                //   password: loginCubit.passCon.text,
                                //   mobileToken: fcmToke,
                                // );
                              }
                            },
                          );
                        },
                      ),
                      const CustomSizedBox(
                        height: 40,
                      ),
                      // انشاء حساب
                      CustomButton(
                        height: 60,
                        width: double.infinity,
                        btnColor: AppColors.whiteColor,
                        borderColor: AppColors.grey1Color,
                        btnText: CustomText(
                          text: LocaleKeys.createNewAccount.tr(),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          textColor: AppColors.blackColor,
                        ),
                        onPressed: () {
                          // AppNav.customNavigator(
                          //   context: context,
                          //   screen: RegisterScreen(),
                          //   finish: false,
                          // );
                        },
                      ),
                      const CustomSizedBox(
                        height: 20,
                      ),
                      // تخطى
                      CustomButton(
                        height: 60,
                        width: double.infinity,
                        btnColor: AppColors.mainColor,
                        borderColor: AppColors.mainColor,
                        btnText: CustomText(
                          text: LocaleKeys.skip.tr(),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          textColor: AppColors.blackColor,
                        ),
                        onPressed: () {
                          // SharedPreferencesHelper.removeData(key: "userToken");
                          // HomeCubit.get(context).getHomeData();
                          // AppNav.customNavigator(
                          //   context: context,
                          //   screen: const LayOutScreen(),
                          //   finish: false,
                          // );
                        },
                      ),
                      const CustomSizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
