import 'package:chores_app/branding/library/library.dart';
import 'package:chores_app/motivation/src/domain/model/chore.dart';
import 'package:chores_app/motivation/src/domain/repository/chore_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChoreForm extends StatelessWidget with SelfSubmitWidget {
  final GlobalKey<_FormFieldsState> _stateKey = GlobalKey();
  final String choreId;

  ChoreForm(this.choreId);

  @override
  Future<void> submit() async {
    _stateKey.currentState.submit(choreId);
  }

  @override
  Widget build(BuildContext context) {
    return _FormFields(key: _stateKey);
  }
}

class _FormFields extends StatefulWidget {
  _FormFields({Key key}) : super(key: key);

  @override
  _FormFieldsState createState() => _FormFieldsState();
}

class _FormFieldsState extends State<_FormFields> {
  TextEditingController rewardController = TextEditingController();

  Future<void> submit(String choreId) async {
    await context.read<ChoreRepository>().add(Chore(
          id: choreId,
          reward: int.parse(rewardController.text),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: TextFormField(
        controller: rewardController,
        decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Reward'),
        validator: (value) {
          try {
            int.parse(rewardController.text);
            return null;
          } catch (e) {
            return 'Must be number';
          }
        },
      ),
    );
  }
}
