import 'package:chores_app/membership/src/domain/model/profile.dart';
import 'package:chores_app/membership/src/infrastructure/repository/in_memory_profile_repository.dart';
import 'package:provider/provider.dart';

final profileRepository = InMemoryProfileRepository();

final providers = [
  StreamProvider<Map<String, Profile>>.value(
    value: profileRepository.getFamilyMembers().map(
          (list) => Map.fromIterable(list, key: (e) => e.id, value: (e) => e),
        ),
    initialData: {},
  )
];
