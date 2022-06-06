
import 'package:flutter/widgets.dart';
import 'package:volume_one/utils/widgets/app_image_widget.dart';

abstract class AppImages {
  AppImages._();

  static const String _assetPath = "assets/images/";

  static AppImageBuilder get appLogo =>
      AppImageBuilder(_assetPath + 'app_logo.png');

  static AppImageBuilder get imgOnBoarding1 =>
      AppImageBuilder(_assetPath + 'img_onboarding1.png');

  static AppImageBuilder get imgOnBoarding2 =>
      AppImageBuilder(_assetPath + 'img_onboarding2.png');

  static AppImageBuilder get imgOnBoarding3 =>
      AppImageBuilder(_assetPath + 'img_onboarding3.png');

  static AppImageBuilder get imgOnBoarding4 =>
      AppImageBuilder(_assetPath + 'img_onboarding4.png');

  static AppImageBuilder get imgSigninLogo =>
      AppImageBuilder(_assetPath + 'img_signin_logo.png');
}

class AppImageBuilder {
  final String assetPath;

  AppImageBuilder(this.assetPath);

  Widget widget(
      {Key? key,
        bool matchTextDirection = false,
        AssetBundle? bundle,
        String? package,
        double? width,
        double? height,
        BoxFit? fit = BoxFit.contain,
        Alignment alignment = Alignment.center,
        Color? color,
        BorderRadius? borderRadius,
        Widget? placeholder,
        String? errorImageUrl,
        int? memCacheHeight}) {
    return AppImage(
      assetPath,
      key: key,
      width: width,
      height: height,
      fit: fit,
      color: color,
      alignment: alignment,
      placeholder: placeholder,
      errorImageUrl: errorImageUrl,
      memCacheHeight: memCacheHeight,
    );
  }
}
