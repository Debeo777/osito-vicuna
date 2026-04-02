import 'package:flutter/material.dart';
import '../screens/splash_screen.dart';
import '../screens/home_screen.dart';
import '../screens/store_screen.dart';
import '../screens/info_screen.dart';
import '../screens/merch_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String home = '/home';
  static const String store = '/store';
  static const String info = '/info';
  static const String merch = '/merch';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return _fadeRoute(const SplashScreen(), settings);
      case home:
        return _fadeRoute(const HomeScreen(), settings);
      case store:
        return _fadeRoute(const StoreScreen(), settings);
      case info:
        return _fadeRoute(const InfoScreen(), settings);
      case merch:
        return _fadeRoute(const MerchScreen(), settings);
      default:
        return _fadeRoute(const SplashScreen(), settings);
    }
  }

  static PageRouteBuilder _fadeRoute(Widget page, RouteSettings settings) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (_, __, ___) => page,
      transitionsBuilder: (_, animation, __, child) =>
          FadeTransition(opacity: animation, child: child),
      transitionDuration: const Duration(milliseconds: 300),
    );
  }
}
