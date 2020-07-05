import 'package:chores_app/branding/composite/widget/chore_form.dart';
import 'package:flutter/material.dart';

class ChoreFormScreen extends StatelessWidget {
  final String choreId;

  ChoreFormScreen({@required this.choreId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Chore'),
      ),
      body: ChoreForm(choreId: choreId),
    );
  }
}
