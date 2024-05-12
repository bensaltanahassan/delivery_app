import 'package:delivery_app/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      this.labelText,
      this.prefixIcon,
      this.controller,
      this.isPassword = false,
      this.suffixIcon,
      this.initialValue,
      this.keyboardType,
      this.borderColor = AppColors.secondColor,
      this.hintColor,
      this.validator,
      this.fontColor});

  final Color? hintColor;
  final Color? fontColor;
  final String? labelText;
  final IconData? prefixIcon;
  final TextEditingController? controller;
  final bool isPassword;
  final Widget? suffixIcon;
  final String? initialValue;
  final TextInputType? keyboardType;
  final Color borderColor;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      initialValue: initialValue,
      obscureText: isPassword,
      keyboardType: keyboardType ?? TextInputType.text,
      controller: controller,
      style: TextStyle(color: fontColor),
      decoration: InputDecoration(
        errorStyle: const TextStyle(color: AppColors.secondColor),
        labelText: labelText,
        labelStyle: TextStyle(color: hintColor),
        hintStyle: TextStyle(color: hintColor),
        prefixIcon:
            prefixIcon != null ? Icon(prefixIcon, color: Colors.white) : null,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10).r,
          borderSide: BorderSide(color: borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)).r,
          borderSide: BorderSide(color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)).r,
          borderSide: BorderSide(color: borderColor),
        ),
      ),
    );
  }
}
