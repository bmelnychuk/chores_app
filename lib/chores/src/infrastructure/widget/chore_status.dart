import 'package:chores_app/chores/src/domain/model/chore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChoreStatus extends StatelessWidget {
  final String choreId;

  ChoreStatus({@required this.choreId});

  @override
  Widget build(BuildContext context) {
    final cachedChores = context.watch<Map<String, Chore>>();
    if (!cachedChores.containsKey(choreId)) return Container();
    final status = cachedChores[choreId].status;
    return Container(
      width: 80,
      child: Text(
        status == Status.IN_PROGRESS ? 'In Progress' : 'Done',
        style: Theme.of(context)
            .textTheme
            .bodyText1
            .copyWith(color: status == Status.IN_PROGRESS ? Colors.orange : Colors.green),
      ),
    );
  }
}
