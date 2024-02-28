import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spinal_health/widgets/custom_Loading.dart';
import '../../../core/app_colors/colors.dart';
import '../../../core/app_images/app_images.dart';
import '../../../core/app_padding/app_padding.dart';
import '../../../lang/locale_keys.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_sized_box.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/cutom_app_bar.dart';
import 'contactUsComponents/form.dart';
import 'contactUsCubit/contact_us_cubit.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey3 = GlobalKey<FormState>();
    return BlocConsumer<ContactUsCubit, ContactUsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var contactUsCubit = ContactUsCubit.get(context);
        return SafeArea(
            child: Scaffold(
          appBar: CustomAppBar(
            title: LocaleKeys.contactUs.tr(),
            color: AppColors.blackColor,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p20),
              child: Form(
                key: formKey3,
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
                      decoration:   const BoxDecoration(
                        color: Colors.black26,
                        shape: BoxShape.circle,

                      ),
                      child: Image.asset(
                        AppImages.logo,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const CustomSizedBox(
                      height: 20,
                    ),
                    FormInContactUs(
                      nameCon: contactUsCubit.nameCon,
                      phoneCon: contactUsCubit.phoneCon,
                      messageCon: contactUsCubit.messageCon,
                      emailCon: contactUsCubit.emailCon,
                    ),
                    const CustomSizedBox(
                      height: 20,
                    ),
                    ConditionalBuilder(
                      condition: state is! ContactUsLoadingState,
                      fallback: (context) {
                        return const CustomLoading();
                      },
                      builder: (context) {
                        return CustomButton(
                          width: double.infinity,
                          btnText: CustomText(
                            text: LocaleKeys.send.tr(),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            textColor: AppColors.whiteColor,
                          ),
                          onPressed: () {
                            print("no");
                            // print(contactUsCubit.selectedContactUsType.toString());
                            if (formKey3.currentState!.validate()) {
                              print("yes");
                              // contactUsCubit.contactUs(
                              //   name: contactUsCubit.nameCon.text,
                              //   message:  contactUsCubit.messageCon.text,
                              //   mobile: contactUsCubit.phoneCon.text,
                              //   email: contactUsCubit.emailCon.text,
                              //   typeContact :  contactUsCubit.selectedContactUsType.toString(),
                              // );
                            }
                          },
                        );
                      },
                    ),
                    const CustomSizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
      },
    );
  }
}
