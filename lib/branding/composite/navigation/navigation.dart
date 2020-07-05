import 'dart:async';

import 'package:chores_app/branding/composite/navigation/screen/chore_form_screen.dart';
import 'package:chores_app/branding/composite/navigation/screen/home_screen.dart';
import 'package:chores_app/branding/composite/navigation/screen/splash_screen.dart';
import 'package:chores_app/it_ops/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Navigation {
  static const String _initialRoute = '/';
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  StreamSubscription<Session> sessionSubscription;

  String get initialRoute => _initialRoute;

  Navigation() {
    this.sessionSubscription = Auth.instance.sessionStream.listen((session) {
      if (session.status == Status.loggedIn) {
        goToHomeScreen();
      }
    });
  }

  Route onGenerateRoute(RouteSettings settings) {
    final name = settings.name;
    final args = settings.arguments;

    switch (name) {
      case _initialRoute:
        return _generateRoute(settings, SplashScreen());
      case '/home':
        return _generateRoute(settings, HomeScreen());
      case '/choreForm':
        return _generateRoute(settings, ChoreFormScreen(choreId: args));
      default:
        return null;
    }
  }

  PageRoute _generateRoute(RouteSettings settings, Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
      settings: settings,
    );
  }

  void goBack() {
    navigatorKey.currentState.pop();
  }

  void goToHomeScreen() {
    navigatorKey.currentState.pushNamedAndRemoveUntil('/home', (r) => false);
  }

  void goToChoreForm(String choreId) {
    navigatorKey.currentState.pushNamed('/choreForm', arguments: choreId);
  }

  dispose() {
    sessionSubscription.cancel();
  }
}
