import 'package:chores_app/branding/composite/navigation/navigation.dart';
import 'package:chores_app/branding/library/library.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chores_app/chores/chores.dart' as Chores;
import 'package:chores_app/motivation/motivation.dart' as Motivation;

class ChoreForm extends StatelessWidget {
  final String choreId;

  ChoreForm({@required this.choreId});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: CompositeForm(
        children: [
          Chores.ChoreForm(choreId),
          Motivation.ChoreForm(choreId),
        ],
        submit: Text('Submit'),
        onSubmit: () {
          context.read<Navigation>().goBack();
        },
      ),
    );
  }
}
