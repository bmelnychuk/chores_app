import 'package:chores_app/branding/composite/navigation/navigation.dart';
import 'package:chores_app/branding/library/library.dart';
import 'package:chores_app/chores/chores.dart' as Chores;
import 'package:chores_app/membership/membership.dart';
import 'package:chores_app/motivation/motivation.dart' as Motivation;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChoreForm extends StatelessWidget {
  final String choreId;

  ChoreForm({@required this.choreId});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: CompositeForm(
        child: Column(
          children: <Widget>[
            Chores.ChoreForm(choreId),
            Motivation.ChoreForm(choreId),
            FamilyMembers(
              builder: (members) => Chores.ChoreAssigneeSelect(
                choreId: choreId,
                familyMembers: members,
                itemBuilder: (ctx, profileId) => ProfilePreview(profileId),
              ),
            ),
            SizedBox(height: 16),
            CompositeSubmitButton(
              onPressed: () {
                context.read<Navigation>().goBack();
              },
              child: Text('Submit'),
            )
          ],
        ),
      ),
    );
  }
}

class ProfilePreview extends StatelessWidget {
  final String profileId;

  ProfilePreview(this.profileId);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ProfileAvatar(profileId: profileId, size: 56),
        SizedBox(height: 8),
        ProfileName(
          profileId: profileId,
        ),
      ],
    );
  }
}
