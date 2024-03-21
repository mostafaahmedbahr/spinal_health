 import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spinal_health/core/utils/nav.dart';
import 'package:spinal_health/screens/layout/layout_screen.dart';
import 'package:spinal_health/screens/register/register_cubit/register_cubit.dart';
import 'package:spinal_health/screens/register/register_cubit/register_states.dart';

import '../../core/app_colors/colors.dart';
import '../../core/app_validator/app_validator.dart';
import '../../lang/locale_keys.dart';
import '../../widgets/custom_Loading.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_sized_box.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_text_form_filed.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    var formKey2 = GlobalKey<FormState>();
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if(state is RegisterSuccessState){
            AppNav.customNavigator(context: context,
                screen: const LayoutScreen(),
                finish: true,
            );
          }
        },
    builder: (context, state) {
      var registerCubit = RegisterCubit.get(context);
          return Form(
            key: formKey2,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const CustomSizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Container(
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child:
                                registerCubit.file!=null ?
                                Image.file(
                                  registerCubit.file!,
                                  fit: BoxFit.cover,
                                  height: 140,
                                  width: 140,
                                ) :
                                Container(
                                  height: 140,
                                  width: 140,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: AppColors.whiteColor,
                                      border: Border.all(
                                        color: AppColors.grey1Color,
                                      )
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        color: AppColors.grey1Color.withOpacity(.5),
                                        border: Border.all(
                                          color: AppColors.grey1Color,
                                        )
                                    ),
                                    child: const Icon(Icons.person,
                                      size: 50,
                                      color: AppColors.whiteColor,
                                    ),
                                  ),
                                ) ,
                              )) ,
                          InkWell(
                            onTap: () {
                              registerCubit.uploadOnlyImage();
                            }, child: const CircleAvatar(
                            backgroundColor: AppColors.primaryColor,
                            radius: 20,
                            child: Icon(
                              Icons.camera_alt, color: AppColors.whiteColor,),
                          ),
                          ),
                        ],
                      ),
                    ),
                    const CustomSizedBox(
                      height: 30,
                    ),
                    DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        isExpanded: true,
                        hint: const Text("Type"),
                        items: registerCubit.userTypesList
                            .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                              color: AppColors.blackColor,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ))
                            .toList(),
                        value: registerCubit.userType,
                        onChanged: (value) {
                          setState(() {
                            registerCubit.userType = value as String;
                            print(registerCubit.userType);
                          });
                        },
                        buttonStyleData: ButtonStyleData(
                          height: 56,
                          padding:
                          const EdgeInsets.only(left: 14, right: 14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: AppColors.grey1Color,
                            ),
                            color: AppColors.grey1Color.withOpacity(0.2),
                          ),
                        ),
                        iconStyleData: const IconStyleData(
                          icon: Icon(
                            Icons.arrow_drop_down,
                          ),
                          iconSize: 20,
                          iconEnabledColor: AppColors.grey1Color,
                          iconDisabledColor: AppColors.grey1Color,
                        ),
                        dropdownStyleData: DropdownStyleData(
                          maxHeight: 200,
                          width: MediaQuery.of(context).size.width * 0.7,
                          padding: null,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: AppColors.grey1Color.withOpacity(0.2),
                          ),
                          elevation: 8,
                          offset: const Offset(-20, 0),
                          scrollbarTheme: ScrollbarThemeData(
                            radius: const Radius.circular(40),
                            thickness:
                            MaterialStateProperty.all<double>(6),
                            thumbVisibility:
                            MaterialStateProperty.all<bool>(true),
                          ),
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          height: 40,
                          padding: EdgeInsets.symmetric(horizontal: 40),
                        ),
                      ),
                    ),
                    const CustomSizedBox(
                      height: 18,
                    ),
                    CustomTextFormField(
                      controller: registerCubit.nameCon,
                      keyboardType: TextInputType.name,
                      validator: (String? value) {
                        return MyValidators.displayNameValidator(value);
                      },
                      hintText: LocaleKeys.name.tr(),
                    ),
                    const CustomSizedBox(
                      height: 18,
                    ),
                    CustomTextFormField(
                      controller: registerCubit.emailCon,
                      keyboardType: TextInputType.emailAddress,
                      validator: (String? value) {
                        return MyValidators.emailValidator(value);
                      },
                      hintText: LocaleKeys.email.tr(),
                    ),
                    const CustomSizedBox(
                      height: 18,
                    ),
                
                    CustomTextFormField(
                      controller: registerCubit.mobileCon,
                      keyboardType: TextInputType.number,
                      validator: (String? value) {
                        return MyValidators.phoneValidator(value);
                      },
                      hintText: LocaleKeys.phone.tr(),
                    ),
                    const CustomSizedBox(
                      height: 18,
                    ),
                
                    CustomTextFormField(
                      controller: registerCubit.addressCon,
                      keyboardType: TextInputType.text,
                      validator: (String? value) {
                        return MyValidators.displayMessageValidator(value);
                      },
                      hintText: LocaleKeys.address.tr(),
                    ),
                    const CustomSizedBox(
                      height: 18,
                    ),
                
                    CustomTextFormField(
                      obscureText: registerCubit.isVisible,
                      controller: registerCubit.passCon,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (String? value) {
                        return MyValidators.passwordValidator(value);
                      },
                      icon: IconButton(
                        color: AppColors.grey1Color,
                        icon: registerCubit.isVisible
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                        onPressed: () {
                          registerCubit.changeSuffixIcon();
                        },
                      ),
                      hintText: LocaleKeys.password.tr(),
                    ),
                    const CustomSizedBox(
                      height: 30,
                    ),
                
                    ConditionalBuilder(
                      condition: state is! RegisterLoadingState,
                      fallback: (context) {
                        return const CustomLoading();
                      },
                      builder: (context) {
                        return CustomButton(
                          height: 60,
                          width: double.infinity,
                          btnColor: AppColors.thirdMainColor,
                          borderColor: AppColors.thirdMainColor,
                          btnText: CustomText(
                            text: LocaleKeys.createNewAccount.tr(),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            textColor: AppColors.whiteColor,
                          ),
                          onPressed: () {
                            if (formKey2.currentState!.validate()) {
                              registerCubit.register(
                                imageUrl: registerCubit.imageUrl.toString(),
                                userType : registerCubit.userType.toString(),
                                context: context,
                                  name: registerCubit.nameCon.text,
                                  email:  registerCubit.emailCon.text,
                                  phone: registerCubit.mobileCon.text,
                                  password: registerCubit.passCon.text,
                                address: registerCubit.addressCon.text,
                              );
                            }
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
    },

      ),
    ));
  }
}
