import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/screens/splash/view/splash_screen.dart';
import 'package:grocery_app/src/app/enums/app_enums.dart';
import 'package:grocery_app/theme/theme.dart';
void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: false,
      builder: (_, child) {
        return MaterialApp(
          title: 'Nectar',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.getTheme(),
          themeMode: ThemeMode.light,
          darkTheme: AppTheme.getTheme(theme: AllThemes.dark),
          home: const SplashView(),
        );
      },
    );
  }
}
