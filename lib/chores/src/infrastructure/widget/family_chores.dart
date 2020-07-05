import 'package:chores_app/chores/src/domain/model/chore.dart';
import 'package:chores_app/chores/src/domain/repository/chore_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FamilyChores extends StatelessWidget {
  final Widget Function(BuildContext, List<String>) builder;

  FamilyChores({@required this.builder});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Chore>>.value(
      initialData: [],
      value: context.watch<ChoreRepository>().getFamilyChores(),
      child: Consumer(
        builder: (_, List<Chore> chores, child) {
          final choreIds = chores.map((c) => c.id).toList();
          return builder(context, choreIds);
        },
      ),
    );
  }
}
