import 'package:chores_app/chores/src/domain/model/chore.dart';
import 'package:chores_app/chores/src/domain/repository/chore_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ChoreProvider {
  static SingleChildWidget byIds(BuildContext context, List<String> ids) {
    final choresRepository = context.read<ChoreRepository>();
    return StreamProvider<Map<String, Chore>>.value(
      value: choresRepository.getByIds(ids).map(
            (list) => Map.fromIterable(list, key: (e) => e.id, value: (e) => e),
          ),
      initialData: {},
    );
  }
}
