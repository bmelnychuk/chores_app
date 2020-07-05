import 'package:chores_app/motivation/src/domain/model/chore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChoreReward extends StatelessWidget {
  final String choreId;

  ChoreReward({@required this.choreId});

  @override
  Widget build(BuildContext context) {
    final cachedChores = context.watch<Map<String, Chore>>();
    if (!cachedChores.containsKey(choreId)) return Text('');
    return Text(
      '${cachedChores[choreId].reward}',
      style: Theme.of(context).textTheme.subtitle2,
    );
  }
}
