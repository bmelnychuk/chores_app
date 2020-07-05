import 'package:chores_app/branding/composite/navigation/navigation.dart';
import 'package:chores_app/chores/chores.dart' as Chores;
import 'package:chores_app/it_ops/auth/src/session_provider.dart';
import 'package:chores_app/membership/membership.dart' as Membership;
import 'package:chores_app/motivation/motivation.dart' as Motivation;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EnvironmentProvider extends StatelessWidget {
  final Widget child;

  EnvironmentProvider({@required this.child});

  @override
  Widget build(BuildContext context) {
    return SessionProvider(
      child: MultiProvider(
        providers: [
          Provider<Navigation>(
            create: (context) => Navigation(),
            dispose: (context, navigation) => navigation.dispose(),
          ),
          ...Membership.providers,
          ...Chores.providers,
          ...Motivation.providers,
        ],
        child: child,
      ),
    );
  }
}
