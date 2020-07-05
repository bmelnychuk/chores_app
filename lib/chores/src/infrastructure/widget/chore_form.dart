import 'package:chores_app/branding/library/library.dart';
import 'package:chores_app/chores/src/domain/model/chore.dart';
import 'package:chores_app/chores/src/domain/repository/chore_repository.dart';
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
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  Future<void> submit(String choreId) async {
    await context.read<ChoreRepository>().add(Chore(
          id: choreId,
          dueDate: DateTime.now(),
          description: descriptionController.text,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: descriptionController,
            decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Description'),
            validator: (value) => value.isEmpty ? 'Please enter some text' : null,
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: dateController,
            decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Due date'),
            validator: (value) {
              try {
                DateTime.parse(dateController.text);
                return null;
              } catch (e) {
                return 'Invalid date format';
              }
            },
          ),
        ],
      ),
    );
  }
}
