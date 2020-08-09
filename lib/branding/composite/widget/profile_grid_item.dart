import 'package:chores_app/branding/library/library.dart';
import 'package:chores_app/membership/membership.dart';
import 'package:chores_app/motivation/motivation.dart';
import 'package:flutter/material.dart';

class ProfileGridItem extends StatelessWidget {
  final String profileId;

  ProfileGridItem({@required this.profileId});

  Widget build(BuildContext context) {
    return BorderedCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              ProfileAvatar(profileId: profileId, size: 92),
              BottomRightBadge(
                child: ProfileScore(profileId: profileId, style: Theme.of(context).textTheme.subtitle2),
              ),
            ],
          ),
          SizedBox(height: 16),
          ProfileName(profileId: profileId, style: Theme.of(context).textTheme.subtitle1),
        ],
      ),
    );
  }
}
