import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.title,
    this.titleColor,
    required this.buttonColor,
    this.width,
    this.height,
    this.radius,
    this.titleSize,
    this.onPressed,
    this.fontWeight,
    this.widget,
  });
  final String? title;
  final Color? titleColor;
  final Color buttonColor;
  final double? width;
  final double? height;
  final double? radius;
  final double? titleSize;
  final FontWeight? fontWeight;
  final void Function()? onPressed;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        minimumSize: Size(width ?? 150.w, height ?? 50.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 10),
        ),
      ),
      child: widget ??
          Text(
            title!,
            style: TextStyle(
              color: titleColor,
              fontSize: titleSize,
              fontWeight: fontWeight ?? FontWeight.normal,
            ),
          ),
    );
  }
}
