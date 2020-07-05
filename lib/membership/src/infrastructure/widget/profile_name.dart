import 'package:chores_app/membership/src/domain/model/profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileName extends StatelessWidget {
  final String profileId;
  final TextStyle style;

  ProfileName({@required this.profileId, this.style});

  @override
  Widget build(BuildContext context) {
    final familyMembers = context.watch<Map<String, Profile>>();
    if (!familyMembers.containsKey(profileId)) return Container();
    return Text(familyMembers[profileId].name, style: this.style);
  }
}
