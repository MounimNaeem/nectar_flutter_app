import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/common_widgets/button_widget.dart';
import 'package:grocery_app/common_widgets/input_field_widget.dart';
import 'package:grocery_app/common_widgets/inputfield_label_widget.dart';
import 'package:grocery_app/screens/login/view/login_view.dart';
import 'package:grocery_app/screens/signup/provider/signup_provider.dart';
import 'package:grocery_app/services/common_ui_service.dart';
import 'package:grocery_app/services/navigation_services.dart';
import 'package:grocery_app/theme/font_styles/light_font_style/light_font_style.dart';
import 'package:grocery_app/theme/light_base_theme.dart';

class SignupView extends ConsumerWidget with CommonUiService {
  final signupProvider = ChangeNotifierProvider(
    (ref) => SignupProvider(),
  );

  final _formKey = GlobalKey<FormState>();

  SignupView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final notifier = ref.watch(signupProvider);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: RepaintBoundary(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 60, sigmaY: 60),
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/auth_bg_img.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      // height: double.infinity,
                      width: double.infinity,
                      child: ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 60, sigmaY: 60),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.w),
                            child: Column(
                              children: [
                                77.verticalSpace,
                                SvgPicture.asset('assets/red_carrot_img.svg'),
                                100.verticalSpace,
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Sign Up",
                                    style: glorySemiBold.copyWith(
                                      fontSize: 28,
                                    ),
                                  ),
                                ),
                                15.verticalSpace,
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Enter your Credentials to continue",
                                    style: gloryMedium.copyWith(
                                        color: theme.hintColor),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    40.verticalSpace,
                    const InputFieldLabel(
                      text: 'Username',
                    ),
                    InputField(
                      hint: 'Enter your username',
                      controller: notifier.nameController,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      validator: notifier.nameValidator,
                    ),
                    20.verticalSpace,
                    const InputFieldLabel(
                      text: 'Email',
                    ),
                    InputField(
                      hint: 'Enter your email',
                      controller: notifier.emailController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      validator: notifier.emailValidator,
                    ),
                    20.verticalSpace,
                    const InputFieldLabel(
                      text: 'Password',
                    ),
                    InputField(
                      hint: 'Enter your password',
                      controller: notifier.passwordController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                      obscure: true,
                      validator: notifier.passwordValidator,
                    ),
                    20.verticalSpace,
                    Center(
                      child: RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "By continuing you agree to our ",
                              style: gloryMedium.copyWith(
                                  color: theme.hintColor, fontSize: 14.sp),
                            ),
                            TextSpan(
                              text: "Terms of Service",
                              style: gloryMedium.copyWith(
                                  color: theme.primaryColor, fontSize: 14.sp),
                            ),
                            TextSpan(
                              text: " and ",
                              style: gloryMedium.copyWith(
                                  color: theme.hintColor, fontSize: 14.sp),
                            ),
                            TextSpan(
                              text: "Privacy Policy",
                              style: gloryMedium.copyWith(
                                  color: theme.primaryColor, fontSize: 14.sp),
                            ),
                          ],
                        ),
                      ),
                    ),
                    30.verticalSpace,
                    ButtonWidget(
                        btnText: 'Sing Up',
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            notifier.signup(
                              moveToNextScreen: (screen) {},
                              showToastMsg: (
                                      {required message, required toastType}) =>
                                  showToastMsg(
                                      message: message,
                                      toastType: toastType,
                                      context: context),
                            );
                          }
                        },
                        textStyle: buttonTextStyle),
                    25.verticalSpace,
                    GestureDetector(
                      onTap: () {
                        NavigationService.pushNavigation(
                            context: context, navigationScreen: LoginView());
                      },
                      child: Center(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Already have an account? ",
                                style: glorySemiBold.copyWith(
                                    color: blackColor, fontSize: 14.sp),
                              ),
                              TextSpan(
                                  text: "Login",
                                  style: glorySemiBold.copyWith(
                                      color: theme.primaryColor,
                                      fontSize: 14.sp))
                            ],
                          ),
                        ),
                      ),
                    ),
                    50.verticalSpace,
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
