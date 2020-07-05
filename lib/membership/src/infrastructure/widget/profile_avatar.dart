import 'package:chores_app/branding/library/library.dart';
import 'package:chores_app/membership/src/domain/model/profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileAvatar extends StatelessWidget {
  final String profileId;
  final double size;

  ProfileAvatar({@required this.profileId, this.size});

  @override
  Widget build(BuildContext context) {
    final familyMembers = context.watch<Map<String, Profile>>();
    if (!familyMembers.containsKey(profileId)) return Container();
    return Avatar(
      url: familyMembers[profileId].picture,
      size: this.size,
    );
  }
}
