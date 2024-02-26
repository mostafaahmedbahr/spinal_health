import 'package:flutter/material.dart';


import '../core/colors.dart';



//ignore: must_be_immutable
class CustomFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String? value) validator;
  final String label;
  final Key? formKey;
  final TextInputType keyboardType;
  final String hintText;
  final bool isReadOnly;
  Widget? suffixWidget;
  Color? labelColor;
  CustomFormField({Key? key,
    this.labelColor,
    required this.validator,
    required this.controller,
    required this.label,
    required this.keyboardType,
    required this.hintText,
    required this.isReadOnly,
    this.formKey,
    this.suffixWidget
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      key: formKey,
      onTap: (){},
      readOnly: isReadOnly,
      controller:controller,
      keyboardType:keyboardType,
      style: const TextStyle(
        color: AppColors.blackColor,
      ),
      validator: validator,
      decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.whiteColor,
          border:OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          enabledBorder:   OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(
                color: AppColors.blackColor,
              )
          ),
          focusedBorder:   OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(
                color: AppColors.blackColor,
              )
          ),
          labelText: label,
          labelStyle: TextStyle(
              color: labelColor??Colors.black
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: AppColors.blackColor,
          ),
          suffix: suffixWidget,
          prefixIconConstraints: const BoxConstraints(maxHeight: 30,maxWidth: 30)
      ),
    );
  }
}