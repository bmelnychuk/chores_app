import 'package:chores_app/branding/composite/widget/chore_list_item.dart';
import 'package:chores_app/chores/chores.dart' as Chores;
import 'package:chores_app/motivation/motivation.dart' as Motivation;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChoresList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Chores.FamilyChores(
      builder: (context, choreIds) {
        if (choreIds.isEmpty) return Container();

        return MultiProvider(
          providers: [
            Chores.ChoreProvider.byIds(context, choreIds),
            Motivation.ChoreProvider.byIds(context, choreIds),
          ],
          child: ListView.separated(
            padding: EdgeInsets.all(16),
            itemBuilder: (_, i) => ChoreListItem(choreId: choreIds[i]),
            itemCount: choreIds.length,
            separatorBuilder: (context, index) => Container(height: 16),
          ),
        );
      },
    );
  }
}
