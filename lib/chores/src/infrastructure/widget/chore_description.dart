import 'package:chores_app/chores/src/domain/model/chore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChoreDescription extends StatelessWidget {
  final String choreId;

  ChoreDescription({@required this.choreId});

  @override
  Widget build(BuildContext context) {
    final cachedChores = context.watch<Map<String, Chore>>();
    if (!cachedChores.containsKey(choreId)) return Container();
    return Text(
      cachedChores[choreId].description,
      style: Theme.of(context).textTheme.subtitle1,
    );
  }
}
