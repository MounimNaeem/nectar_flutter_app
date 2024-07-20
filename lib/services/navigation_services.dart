import 'package:flutter/material.dart';

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static void pushNavigation(
      {required BuildContext context,
      required Widget navigationScreen,
      bool showFadeTransition = false,
      Duration? duration}) {
    Navigator.push(
        context,
        PageRouteBuilder(
          transitionDuration: duration ?? Duration(milliseconds: 500),
          pageBuilder: (_, __, ___) => navigationScreen,
          transitionsBuilder: (showFadeTransition)
              ? (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                }
              : (_, __, ___, child) => child,
        ));
  }

  static void pushReplacementNavigation(
      {required BuildContext context,
      required Widget navigationScreen,
      bool showFadeTransition = false,
      Duration? duration}) {
    Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: duration ?? Duration(milliseconds: 300),
          pageBuilder: (_, __, ___) => navigationScreen,
          transitionsBuilder: (showFadeTransition)
              ? (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                }
              : (_, __, ___, child) => child,
        ));
  }
}
