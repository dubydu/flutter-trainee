import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:volume_one/utils/common/app_color.dart';
import 'package:volume_one/utils/common/app_text.dart';

typedef OnAuthTextFieldChanged = void Function(String);

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    Key? key,
    required this.titleText,
    required this.hintText,
    required this.onTextFieldChanged,
    this.keyboardType = TextInputType.text,
    this.backgroundColor = AppColors.offWhite,
    this.controller,
    this.errorMessage,
    required this.showError
  }) : super(key: key);

  final String titleText;
  final String hintText;
  final OnAuthTextFieldChanged onTextFieldChanged;
  final TextInputType? keyboardType;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final bool showError;
  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          height: 60,
          decoration: BoxDecoration(
              color: backgroundColor,
              border: Border.all(
                  color: showError ? AppColors.red : Colors.transparent,
                  width: showError ? 1 : 0
              )
          ),
          child: Center(
            child: TextField(
              controller: controller,
              scrollPadding: EdgeInsets.all(40.0.sp),
              keyboardType: keyboardType,
              style: AppText.primary('').textStyle,
              obscureText: keyboardType == TextInputType.visiblePassword,
              onChanged: (text) {
                onTextFieldChanged(text);
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 22.w, right: 22.w),
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: AppText.primary('', color: AppColors.black.withOpacity(.28)).textStyle,
              ),
            ),
          ),
        ),
        SizedBox(height: 4.h),
        if (showError) AppText.primary(errorMessage ?? '', color: AppColors.red, fontSize: 11)
      ],
    );
  }
}
