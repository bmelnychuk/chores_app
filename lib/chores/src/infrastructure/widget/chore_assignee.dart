import 'package:chores_app/chores/src/domain/model/chore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChoreAssignee extends StatelessWidget {
  final String choreId;
  final Widget Function(String) builder;

  ChoreAssignee({@required this.choreId, @required this.builder});

  @override
  Widget build(BuildContext context) {
    final cachedChores = context.watch<Map<String, Chore>>();
    if (!cachedChores.containsKey(choreId)) return Container();
    return this.builder(cachedChores[choreId].assigneeId);
  }
}
