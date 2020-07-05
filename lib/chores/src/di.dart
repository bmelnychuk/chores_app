import 'package:chores_app/chores/src/domain/repository/chore_repository.dart';
import 'package:chores_app/chores/src/infrastructure/repository/in_memory_chore_repository.dart';
import 'package:provider/provider.dart';

final providers = [
  Provider<ChoreRepository>(create: (context) => InMemoryChoreRepository()),
];
