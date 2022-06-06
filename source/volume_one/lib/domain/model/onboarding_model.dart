import 'package:flutter/material.dart';
import 'package:volume_one/utils/assets/app_images.dart';

class OnBoardingModel {
  OnBoardingModel({
    this.title,
    this.image,
    this.description
  });

  final String? title;
  final Widget? image;
  final String? description;
}

extension OnBoardingModelExtension on OnBoardingModel {
  // Dummy data
  List<OnBoardingModel> onBoardingList() {
    return <OnBoardingModel>[
      OnBoardingModel(
          title: 'Proven\nspecialists',
          image: AppImages.imgOnBoarding1.widget(),
          description: "We check each specialist before\nhe starts work"),
      OnBoardingModel(
          title: 'Honest\nratings',
          image: AppImages.imgOnBoarding2.widget(),
          description: "We carefully check each specialist\nand put honest ratings"),
      OnBoardingModel(title: 'Insured\norders',
          image: AppImages.imgOnBoarding3.widget(),
          description: "We insure each order for the\namount of \$500"),
      OnBoardingModel(
          title: 'Create\norder',
          image: AppImages.imgOnBoarding4.widget(),
          description: "It's easy, just click on the plus")
    ];
  }
}
