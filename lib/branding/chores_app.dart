import 'package:chores_app/branding/composite/environment_provider.dart';
import 'package:chores_app/branding/composite/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChoresApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return EnvironmentProvider(child: ChoresMaterialApp());
  }
}

class ChoresMaterialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigation = context.watch<Navigation>();
    return MaterialApp(
      navigatorKey: navigation.navigatorKey,
      title: 'Chores App',
      initialRoute: navigation.initialRoute,
      onGenerateRoute: (RouteSettings settings) => navigation.onGenerateRoute(settings),
    );
  }
}
