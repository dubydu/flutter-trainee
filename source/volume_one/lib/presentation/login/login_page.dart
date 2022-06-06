import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:volume_one/presentation/base/material_base_page.dart';
import 'package:volume_one/presentation/login/login_bloc.dart';
import 'package:volume_one/utils/assets/app_icons.dart';
import 'package:volume_one/utils/assets/app_images.dart';
import 'package:volume_one/utils/common/app_color.dart';
import 'package:volume_one/utils/common/app_text.dart';
import 'package:volume_one/utils/widgets/app_navi_widget.dart';
import 'package:volume_one/utils/widgets/button/app_primary_button_widget.dart';
import 'package:volume_one/utils/widgets/textfield/auth_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  // late LoginBloc loginBloc = BlocProvider.of(context, listen: false);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialBasePage(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            color: AppColors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[
                // Header
                AppNavigationWidget(title: 'Sign In'),
                // Body
                LoginBodyWidget(),
              ],
            ),
          ),
        )
    );
  }
}

class LoginBodyWidget extends StatelessWidget {
  const LoginBodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 30.w, right: 30.w),
          child: Column(
            children: <Widget>[
              // Logo
              Container(
                margin: EdgeInsets.only(top: 24.h, bottom: 32.h),
                child: Center(
                  child: SizedBox(
                    width: 100.w,
                    child: AppImages.imgSigninLogo.widget(fit: BoxFit.fitHeight),
                  ),
                ),
              ),
              // Form
              Container(
                padding: EdgeInsets.only(bottom: 16.h),
                child: Column(
                  children: <Widget>[
                    // Name text field
                    // Listen events
                    BlocBuilder<LoginBloc, LoginState>(
                        buildWhen: (previous, current) => (previous.name != current.name),
                        builder: (context, state) {
                          return AuthTextField(
                            showError: state.inValidName,
                            errorMessage: "Please enter no more that 20 characters",
                            titleText: 'Name',
                            hintText: "Enter your name",
                            onTextFieldChanged: (String name) {
                              // Pass data from view controller to BloC
                              context.read<LoginBloc>().onNameChanged(name: name);
                              // read<>: outside Widget or inside function body, closure
                              // watch<>: inside widget
                            },
                          );
                        }
                    ),
                    SizedBox(height: 16.h),
                    // Password text field
                    BlocBuilder<LoginBloc, LoginState>(
                        buildWhen: (previous, current) => (previous.password != current.password),
                        builder: (context, state) {
                          return AuthTextField(
                            showError: state.inValidPassword,
                            keyboardType: TextInputType.visiblePassword,
                            errorMessage: "Password must contain between 6 and 12 characters.",
                            titleText: 'Password',
                            hintText: "Enter your password",
                            onTextFieldChanged: (String pwd) {
                              context.read<LoginBloc>().onPasswordChanged(pwd: pwd);
                            },
                          );
                        }
                    ),
                    // Forgot password
                    Container(
                      alignment: Alignment.topRight,
                      margin: EdgeInsets.only(top: 16.h, bottom: 50.h),
                      child: InkWell(
                        child: AppText.primary('Forgot your password?', color: AppColors.textLightBlack),
                      ),
                    )
                  ],
                ),
              ),
              // Login button
              AppPrimaryButtonWidget(
                title: "Login",
                onPressed: () {

                },
              ),
              // Or
              Container(
                padding: EdgeInsets.only(top: 15.h, bottom: 16.h),
                child: AppText.primary('or'),
              ),
              // Social networks
              SizedBox(
                height: 60.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.lightGray,
                            width: 1
                          )
                        ),
                        child: AppIcons.iconFacebook.widget(),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.lightGray,
                                width: 1
                            )
                        ),
                        child: AppIcons.iconTwitter.widget(),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.lightGray,
                                width: 1
                            )
                        ),
                        child: AppIcons.iconLinkedin.widget(),
                      ),
                    ),
                  ],
                ),
              ),
              // Sign up
              Container(
                padding: EdgeInsets.only(top: 51.h, bottom: 31.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    AppText.primary('Don’t have an account?', color: AppColors.textLightBlack),
                    SizedBox(width: 4.w),
                    AppText.primary(
                        'Sign Up',
                        color: AppColors.pinkLight,
                        decoration: TextDecoration.underline,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
