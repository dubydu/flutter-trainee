import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:volume_one/domain/model/onboarding_model.dart';
import 'package:volume_one/utils/common/app_color.dart';
import 'package:volume_one/utils/common/app_text.dart';

class OnBoardingItemWidget extends StatelessWidget {
  const OnBoardingItemWidget({
    Key? key,
    required this.onBoardingModel
  }) : super(key: key);

  // Data
  final OnBoardingModel? onBoardingModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        // Title
        _buildTitleWidget(),
        // Image
        _buildImageWidget(context),
        // Description
        _buildDescriptionWidget()
      ],
    );
  }

  // Title widget
  Widget _buildTitleWidget() {
    return Container(
        padding: EdgeInsets.only(top: 24.h),
        child: AppText.primary(
          onBoardingModel?.title ?? "",
          fontSize: 40,
          fontFamily: FontFamilyType.ubuntu,
          fontWeight: FontWeightType.medium,
          textAlign: TextAlign.center,
          color: AppColors.textBlack,
        )
    );
  }

  // Image widget
  Widget _buildImageWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 69.w, right: 69.w),
      height: MediaQuery.of(context).size.height * 0.4,
      child: onBoardingModel?.image ?? Container(),
    );
  }

  // Description
  Widget _buildDescriptionWidget() {
    return AppText.bodyMedium(
      onBoardingModel?.description ?? "",
      textAlign: TextAlign.center,
    );
  }
}
