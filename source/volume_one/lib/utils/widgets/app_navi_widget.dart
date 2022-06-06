import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:volume_one/utils/assets/app_icons.dart';
import 'package:volume_one/utils/common/app_color.dart';
import 'package:volume_one/utils/common/app_text.dart';

class AppNavigationWidget extends StatelessWidget {
  const AppNavigationWidget({
    this.title,
    this.bgColor = AppColors.white,
    Key? key
  }) : super(key: key);

  final String? title;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      height: 48.h,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          // Title
          AppText.primary(title ?? '', fontSize: 18.sp),
          // Back button
          Positioned(
              left: 30.w,
              child: AppIcons.iconBackBlack.widget()
          )
        ],
      ),
    );
  }
}
