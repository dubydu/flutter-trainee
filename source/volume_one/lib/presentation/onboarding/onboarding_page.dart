import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:volume_one/domain/model/onboarding_model.dart';
import 'package:volume_one/presentation/base/material_base_page.dart';
import 'package:volume_one/presentation/base/responsive_mixin.dart';
import 'package:volume_one/presentation/login/login_page.dart';
import 'package:volume_one/utils/assets/app_icons.dart';
import 'package:volume_one/utils/common/app_color.dart';
import 'package:volume_one/utils/widgets/button/app_primary_button_widget.dart';
import 'onboarding_item_widget.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> with ResponsiveMixin {

  // Controller
  final PageController _pageController = PageController();
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) async {

    });
  }

  int onboardingLength() {
    return OnBoardingModel().onBoardingList().length;
  }

  bool isNotLatestPage() {
    return currentIndex != (onboardingLength() - 1);
  }

  void _updateControlWidget(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    initResponsive(context);
    return MaterialBasePage(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // Onboarding pages
            _buildOnboardingPagesWidget(),
            // Bottom widgets
            _buildBottomWidgets(context)
          ],
        ),
      ),
    );
  }

  /// Onboarding widget
  Widget _buildOnboardingPagesWidget() {
    return Expanded(
        child: PageView.builder(
            onPageChanged: (index) async {
              _updateControlWidget(index);
            },
            itemCount: onboardingLength(),
            controller: _pageController,
            itemBuilder: (context, index) {
              return OnBoardingItemWidget(
                onBoardingModel: OnBoardingModel().onBoardingList()[index],
              );
          })
    );
  }

  /// Bottom widgets
  Widget _buildBottomWidgets(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 40.h, top: 47.h),
      height: 100.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          if (isNotLatestPage()) ...[
            // Control
            _buildControlWidget(),
            // Next button
            _buildNextButtonWidget(),
          ] else ...[
            // Order button
            _buildCreateOrderWidget(context)
          ]
        ],
      ),
    );
  }

  /// Control widget
  Widget _buildControlWidget() {
    Widget _buildDotsWidget(int index) {
      return Container(
        height: 8.sp,
        margin: EdgeInsets.only(left: 3.w, right: 3.w),
        width: index == currentIndex ? 17.sp : 8.sp,
        decoration: BoxDecoration(
            color: index == currentIndex ? AppColors.darkGray : AppColors.mediumGray,
            borderRadius: BorderRadius.circular(4.sp)
        ),
      );
    }
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(onboardingLength(), (index) => _buildDotsWidget(index))
    );
  }

  /// Next button widget
  Widget _buildNextButtonWidget() {
    return Container(
      padding: EdgeInsets.only(left: 30.w, right: 30.w),
      child: AppPrimaryButtonWidget(title: "Next", isSelected: true, onPressed: () {
        _pageController.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.easeInOutExpo);
      }),
    );
  }

  /// Order button widget
  Widget _buildCreateOrderWidget(BuildContext context) {
    return SizedBox(
      height: 82.h,
      width: 82.h,
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
        },
        child: AppIcons.iconOrderPlus.widget(),
      ),
    );
  }
}