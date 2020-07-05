import 'package:chores_app/motivation/src/domain/model/profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScore extends StatelessWidget {
  final String profileId;
  final TextStyle style;

  ProfileScore({@required this.profileId, this.style});

  @override
  Widget build(BuildContext context) {
    final profiles = context.watch<Map<String, Profile>>();
    if (!profiles.containsKey(profileId)) return Text('');
    return Text('${profiles[profileId].totalScore}', style: this.style);
  }
}
