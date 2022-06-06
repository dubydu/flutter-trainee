import 'package:flutter/widgets.dart';
import 'package:volume_one/utils/widgets/app_image_widget.dart';

abstract class AppIcons {
  AppIcons._();

  static const String _assetPath = "assets/icons/";

  static AppImageBuilder get iconBurgerMenu =>
      AppImageBuilder(_assetPath + 'ic_burger_menu.svg');

  static AppImageBuilder get iconOrderPlus =>
      AppImageBuilder(_assetPath + 'ic_order_plus.svg');

  static AppImageBuilder get iconBackBlack =>
      AppImageBuilder(_assetPath + 'ic_back_black.svg');

  static AppImageBuilder get iconFacebook =>
      AppImageBuilder(_assetPath + 'ic_facebook.svg');

  static AppImageBuilder get iconTwitter =>
      AppImageBuilder(_assetPath + 'ic_twitter.svg');

  static AppImageBuilder get iconLinkedin =>
      AppImageBuilder(_assetPath + 'ic_linkedin.svg');
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
        BoxFit fit = BoxFit.contain,
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
