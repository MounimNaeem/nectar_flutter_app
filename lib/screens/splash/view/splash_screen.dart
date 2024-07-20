import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/screens/on_boarding_/view/on_boarding_view.dart';
import 'package:grocery_app/services/navigation_services.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  @override
  void initState() {
    Timer.periodic(
      const Duration(seconds: 3),
      (timer) => NavigationService.pushReplacementNavigation(
          context: context, navigationScreen: const OnBoardingView()),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: Center(
        child: SvgPicture.asset(
          'assets/nectar_text_logo.svg',
          width: 267.w,
        ),
      ),
    );
  }
}
