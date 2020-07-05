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
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    border: Border.all(width: 2, color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                  ),
                  child: Center(
                    child: ProfileScore(
                      profileId: profileId,
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 16),
          ProfileName(
            profileId: profileId,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ],
      ),
    );
  }
}
