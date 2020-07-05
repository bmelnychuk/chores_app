import 'package:chores_app/membership/src/domain/model/profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FamilyMembers extends StatelessWidget {
  final Widget Function(BuildContext, List<String>) builder;

  FamilyMembers({this.builder});

  @override
  Widget build(BuildContext context) {
    final familyMembers = context.watch<Map<String, Profile>>();
    final profileIds = familyMembers.values.map((c) => c.id).toList();
    return builder(context, profileIds);
  }
}
