import 'package:chores_app/motivation/src/domain/repository/chore_repository.dart';
import 'package:chores_app/motivation/src/domain/repository/profile_repository.dart';
import 'package:chores_app/motivation/src/infrastructure/repository/in_memory_chore_repository.dart';
import 'package:chores_app/motivation/src/infrastructure/repository/in_memory_profile_repository.dart';
import 'package:provider/provider.dart';

final providers = [
  Provider<ChoreRepository>(create: (context) => InMemoryChoreRepository()),
  Provider<ProfileRepository>(create: (context) => InMemoryProfileRepository()),
];
