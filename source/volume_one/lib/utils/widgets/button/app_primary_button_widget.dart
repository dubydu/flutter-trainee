import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:volume_one/utils/common/app_color.dart';
import 'package:volume_one/utils/common/app_text.dart';

class AppPrimaryButtonWidget extends StatelessWidget {
  const AppPrimaryButtonWidget({
    Key? key,
    required this.title,
    this.isSelected = false,
    required this.onPressed,
    this.isLoading = false}) : super(key: key);

  final String title;
  final Function onPressed;
  final bool isSelected;
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (isSelected == true && isLoading == false) {
          onPressed();
        }
      },
      child: Container(
          height: 60.h,
          decoration: BoxDecoration(
              color: backgroundColors(),
              border: Border.all(color: borderColors(), width: 1.25.sp),
          ),
          child: Center(
              child: (isLoading == false)
                  ? AppText.bodyMedium(title, fontWeight: FontWeightType.medium, color: titleColors())
                  : CupertinoActivityIndicator(radius: 15.sp, animating: (isLoading == true))
          )
      ),
    );
  }

  Color borderColors() {
    return isSelected ? Colors.transparent : AppColors.mainGreen;
  }

  Color backgroundColors() {
    return isSelected ? AppColors.mainGreen : AppColors.white;
  }

  Color titleColors() {
    return isSelected ? Colors.white : AppColors.mainGreen;
  }
}
