import 'package:chores_app/branding/library/library.dart';
import 'package:chores_app/chores/src/domain/model/chore.dart';
import 'package:chores_app/chores/src/domain/repository/chore_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChoreForm extends StatefulWidget {
  final String choreId;

  ChoreForm(this.choreId);

  @override
  _ChoreFormState createState() => _ChoreFormState();
}

class _ChoreFormState extends SelfSubmitState<ChoreForm> {
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  @override
  Future<void> submit() async {
    await context.read<ChoreRepository>().add(Chore(
          id: widget.choreId,
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
