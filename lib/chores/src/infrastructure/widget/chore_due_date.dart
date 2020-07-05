import 'package:chores_app/chores/src/domain/model/chore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class ChoreDueDate extends StatelessWidget {
  final String choreId;

  ChoreDueDate({@required this.choreId});

  @override
  Widget build(BuildContext context) {
    final cachedChores = context.watch<Map<String, Chore>>();
    if (!cachedChores.containsKey(choreId)) return Container();
    return Text(
      DateFormat('dd MMM kk:mm').format(cachedChores[choreId].dueDate),
      style: Theme.of(context).textTheme.subtitle2,
    );
  }
}
