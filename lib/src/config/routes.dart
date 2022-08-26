import 'package:flutter/material.dart';
import 'package:flutter_news_app/src/core/routes.dart';
import 'package:flutter_news_app/src/presentation/screens/home_screen.dart';

class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case routeSplash:
        return _materialRoute(Container());
      case '/free':
        // final phoneNumber =
        //     settings.arguments != null ? settings.arguments as String : null;
        return _materialRoute(Container());
      case routeHome:
        return _materialRoute(const HomeScreen());
      case routeSignIn:
        return _materialRoute(Container());
      case routeSignUp:
        return _materialRoute(Container());
      default:
        return _materialRoute(Container());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
