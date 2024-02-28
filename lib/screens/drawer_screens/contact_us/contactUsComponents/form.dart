import 'package:easy_localization/easy_localization.dart';
 import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spinal_health/core/app_validator/app_validator.dart';

import '../../../../core/app_colors/colors.dart';
 import '../../../../lang/locale_keys.dart';
import '../../../../widgets/custom_sized_box.dart';
import '../../../../widgets/custom_text_form_filed.dart';



//ignore: must_be_immutable
class FormInContactUs extends StatelessWidget {
    FormInContactUs({Key? key ,
      required this.nameCon,
      required this.phoneCon,
      required this.messageCon,
      required this.emailCon,
    }) : super(key: key);
  TextEditingController  nameCon;
  TextEditingController  phoneCon;
  TextEditingController  messageCon;
  TextEditingController  emailCon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          controller: nameCon,
          keyboardType: TextInputType.name,
          validator: (value) {
            return  MyValidators.displayNameValidator(value);
          },
          hintText: LocaleKeys.name.tr(),
        ),
        const CustomSizedBox(height: 20,),
        CustomTextFormField(
          controller:  phoneCon,
          keyboardType: TextInputType.number,
          validator: (value) {
            return  MyValidators.phoneValidator(value);
          },
          hintText: LocaleKeys.phone.tr(),
        ),
        const CustomSizedBox(height: 20,),
        CustomTextFormField(
          controller:  emailCon,
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            return  MyValidators.emailValidator(value);
          },
          hintText: LocaleKeys.email.tr(),

        ),
        const CustomSizedBox(height: 20,),
        CustomTextFormField(
          raduis: 15,
          maxLines: 5,
          controller: messageCon,
          keyboardType: TextInputType.text,
          validator: ( value) {
          return  MyValidators.displayMessageValidator(value);
          },
          hintText: LocaleKeys.messageValidate.tr(),
        ),
      ],
    );
  }
}
