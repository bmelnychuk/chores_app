import 'package:chores_app/branding/library/library.dart';
import 'package:chores_app/motivation/src/domain/model/chore.dart';
import 'package:chores_app/motivation/src/domain/repository/chore_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChoreForm extends StatefulWidget {
  final String choreId;

  ChoreForm(this.choreId);

  @override
  _ChoreFormState createState() => _ChoreFormState();
}

class _ChoreFormState extends SelfSubmitState<ChoreForm> {
  TextEditingController rewardController = TextEditingController();

  @override
  Future<void> submit() async {
    context.read<ChoreRepository>().update(Chore(
          id: widget.choreId,
          reward: int.tryParse(rewardController.text),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: TextFormField(
        controller: rewardController,
        decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Reward'),
      ),
    );
  }
}
