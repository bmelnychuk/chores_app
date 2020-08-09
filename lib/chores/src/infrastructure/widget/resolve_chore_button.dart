import 'package:chores_app/chores/src/domain/model/chore.dart';
import 'package:chores_app/chores/src/domain/repository/chore_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResolveChoreButton extends StatelessWidget {
  final void Function() onPressed;
  final String choreId;

  ResolveChoreButton({@required this.choreId, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: new Text("Resolve chore"),
      onPressed: () async {
        await resolveChore(context);
        onPressed();
      },
    );
  }

  Future<void> resolveChore(BuildContext context) async {
    // TODO not good
    final repository = context.read<ChoreRepository>();
    final chore = await repository.getFamilyChores().map((all) => all.firstWhere((c) => c.id == choreId)).first;
    await repository.add(Chore(
      id: chore.id,
      dueDate: chore.dueDate,
      description: chore.description,
      assigneeId: chore.assigneeId,
      status: Status.DONE,
    ));
  }
}
