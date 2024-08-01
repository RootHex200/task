
import 'package:flutter/material.dart';
import 'package:task/src/utils/colors/app_colors.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final String labelText;
  final IconData iconData;
  final Widget? suffixIcon;
  final TextInputType? textInputType;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  const CustomTextFieldWidget({super.key,this.validator,this.textInputType,required this.controller,required this.iconData,required this.labelText,this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      keyboardType:textInputType,
      decoration: InputDecoration(
        prefixIcon:  Icon(iconData, color: AppColors.primaryAppRedColor),
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        fillColor: AppColors.primaryWhiteColor,
        filled: true,
        suffixIcon: suffixIcon,
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryWhiteColor, width: 0.0)),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryWhiteColor, width: 0.0)),
        errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryWhiteColor, width: 0.0)),
      ),
    );
  }
}