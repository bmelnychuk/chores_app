import 'package:chores_app/it_ops/auth/src/auth.dart';
import 'package:chores_app/it_ops/auth/src/session.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SessionProvider extends StatelessWidget {
  final Widget child;

  SessionProvider({@required this.child});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<Session>(
      initialData: Session.unInitialized(),
      create: (context) => Auth.instance.sessionStream,
      child: child,
    );
  }
}
