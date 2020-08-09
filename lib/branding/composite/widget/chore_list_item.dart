import 'package:chores_app/branding/library/library.dart';
import 'package:chores_app/chores/chores.dart';
import 'package:chores_app/chores/src/infrastructure/widget/chore_status.dart';
import 'package:chores_app/membership/membership.dart';
import 'package:chores_app/motivation/motivation.dart';
import 'package:flutter/material.dart';

class ChoreListItem extends StatelessWidget {
  final String choreId;

  ChoreListItem({@required this.choreId});

  Widget build(BuildContext context) {
    return BorderedCard(
      onTap: () {
        showDialog(context: context, builder: (_) => ResolveChoreDialog(choreId));
      },
      padding: EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ChoreDescription(choreId: choreId),
                SizedBox(height: 16),
                Row(
                  children: [
                    ChoreDueDate(choreId: choreId),
                    SizedBox(width: 16),
                    Icon(Icons.monetization_on, color: Colors.orange, size: 20),
                    SizedBox(width: 4),
                    ChoreReward(choreId: choreId),
                    SizedBox(width: 16),
                    ChoreStatus(choreId: choreId),
                  ],
                ),
              ],
            ),
          ),
          ChoreAssignee(
            choreId: choreId,
            builder: (assigneeId) => ProfileAvatar(profileId: assigneeId, size: 48),
          ),
        ],
      ),
    );
  }
}

class ResolveChoreDialog extends StatelessWidget {
  final String choreId;

  ResolveChoreDialog(this.choreId);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Resolve chore?"),
      content: Text("Are you this chore is done?"),
      actions: <Widget>[
        ResolveChoreButton(
          choreId: choreId,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
