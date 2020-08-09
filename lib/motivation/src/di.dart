import 'package:chores_app/chores/chores.dart';
import 'package:chores_app/motivation/src/application/chore_interactor.dart';
import 'package:chores_app/motivation/src/domain/repository/chore_repository.dart';
import 'package:chores_app/motivation/src/domain/repository/profile_repository.dart';
import 'package:chores_app/motivation/src/infrastructure/repository/in_memory_chore_repository.dart';
import 'package:chores_app/motivation/src/infrastructure/repository/in_memory_profile_repository.dart';
import 'package:provider/provider.dart';

final _choreRepository = InMemoryChoreRepository();
final _profileRepository = InMemoryProfileRepository();
final _choreInteractor = ChoreInteractor(_profileRepository, _choreRepository);

final providers = [
  Provider<ChoreRepository>(create: (context) => _choreRepository),
  Provider<ProfileRepository>(create: (context) => _profileRepository),
];

class OnInit {
  Future run() async {
    choreEvents.listen((choreDone) {
      _choreInteractor.resolveChore(choreDone.choreId, choreDone.assigneeId);
    });
  }
}
