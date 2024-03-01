 import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spinal_health/screens/layout_screens/profile/profile_cubit/profile_cubit.dart';
import 'package:spinal_health/screens/layout_screens/profile/profile_cubit/profile_states.dart';

import '../../../lang/locale_keys.dart';
import '../../../widgets/custom_text_form_filed.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileStates>(
      listener: (context, state) {},
    builder: (context, state) {
        var profileCubit = ProfileCubit.get(context);
        profileCubit.nameCon.text = "mostafa";
        profileCubit.emailCon.text = "mostafa@gmail.com";
        profileCubit.phoneCon.text = "01110690299";
        profileCubit.addressCon.text = "giza";
        return  Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                width: 128.0,
                height: 128.0,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(
                  'assets/images/IMG_٢٠٢٢٠٧٢١_٠٢٥٤٠٤.jpg',
                  fit: BoxFit.cover,
                ),
              ),
             const SizedBox(height: 20,),
              CustomTextFormField(
                controller: profileCubit.nameCon,
                keyboardType: TextInputType.emailAddress,
                hintText: LocaleKeys.name.tr(),
              ),
              const SizedBox(height: 20,),
              CustomTextFormField(
                controller: profileCubit.emailCon,
                keyboardType: TextInputType.emailAddress,
                hintText: LocaleKeys.email.tr(),
              ),
              const SizedBox(height: 20,),
              CustomTextFormField(
                controller: profileCubit.phoneCon,
                keyboardType: TextInputType.emailAddress,
                hintText: LocaleKeys.phone.tr(),
              ),
              const SizedBox(height: 20,),
              CustomTextFormField(
                controller: profileCubit.addressCon,
                keyboardType: TextInputType.emailAddress,
                hintText: LocaleKeys.address.tr(),
              ),
              const SizedBox(height: 20,),
            ],
          ),
        );
    },

    );
  }
}
