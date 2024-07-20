import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/common_widgets/button_widget.dart';
import 'package:grocery_app/screens/login/view/login_view.dart';
import 'package:grocery_app/services/navigation_services.dart';
import 'package:grocery_app/theme/font_styles/light_font_style/light_font_style.dart';
import 'package:grocery_app/theme/light_base_theme.dart';

class OnBoardingView extends ConsumerWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/onboarding_bg_img.png',
            fit: BoxFit.cover,
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                485.verticalSpace,
                SvgPicture.asset('assets/carrot_img.svg'),
                35.verticalSpace,
                Text(
                  'Welcome\nto our store',
                  textAlign: TextAlign.center,
                  style:
                      abrilRegular.copyWith(fontSize: 48.sp, color: whiteColor),
                ),
                19.verticalSpace,
                Text(
                  'Get your groceries in aa fast as one hour',
                  style: gloryMedium.copyWith(color: theme.hintColor),
                ),
                40.verticalSpace,
                ButtonWidget(
                    btnText: 'Get Started',
                    onTap: ()=> NavigationService.pushReplacementNavigation(context: context,navigationScreen: LoginView()),
                    textStyle: buttonTextStyle)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
