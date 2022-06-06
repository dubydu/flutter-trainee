import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:volume_one/utils/common/app_color.dart';

class MaterialBasePage extends StatelessWidget {
  const MaterialBasePage({
    required this.child,
    this.bgColor = AppColors.white,
    Key? key}) : super(key: key);

  final Widget child;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    // Build widget
    return Material(
      color: bgColor,
      child: GestureDetector(
        onTap: () {
          _dismiss(unfocus: context);
        },
        child: child,
      ),
    );
  }

  void _dismiss({BuildContext? unfocus}) {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    if (unfocus != null) {
      FocusScope.of(unfocus).unfocus();
    }
  }
}
