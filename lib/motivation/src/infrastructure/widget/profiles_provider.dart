import 'package:chores_app/motivation/src/domain/model/profile.dart';
import 'package:chores_app/motivation/src/domain/repository/profile_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ProfilesProvider {
  static SingleChildWidget byIds(BuildContext context, List<String> ids) {
    final choresRepository = context.read<ProfileRepository>();
    return StreamProvider<Map<String, Profile>>.value(
      value: choresRepository.getByIds(ids).map(
            (list) => Map.fromIterable(list, key: (e) => e.id, value: (e) => e),
          ),
      initialData: {},
    );
  }
}
