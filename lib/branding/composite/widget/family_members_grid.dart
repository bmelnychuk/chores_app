import 'package:chores_app/branding/composite/widget/profile_grid_item.dart';
import 'package:chores_app/membership/membership.dart';
import 'package:chores_app/motivation/src/infrastructure/widget/profiles_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FamilyMembersGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FamilyMembers(
      builder: (_, profileIds) {
        if (profileIds.isEmpty) return Container();

        return MultiProvider(
          providers: [
            ProfilesProvider.byIds(context, profileIds),
          ],
          child: GridView.count(
            padding: EdgeInsets.all(16),
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            crossAxisCount: 3,
            childAspectRatio: 3 / 4,
            children: profileIds.map((id) => ProfileGridItem(profileId: id)).toList(),
          ),
        );
      },
    );
  }
}
