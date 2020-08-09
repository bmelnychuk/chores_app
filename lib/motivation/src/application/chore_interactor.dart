import 'package:chores_app/motivation/src/domain/repository/chore_repository.dart';
import 'package:chores_app/motivation/src/domain/repository/profile_repository.dart';

class ChoreInteractor {
  final ProfileRepository profileRepository;
  final ChoreRepository choreRepository;

  ChoreInteractor(this.profileRepository, this.choreRepository);

  Future<void> resolveChore(String choreId, String profileId) async {
    if (profileId == null) return;
    final profile = await profileRepository.getById(profileId);
    final chore = await choreRepository.getById(choreId);
    profile.resolveChore(chore);
    await profileRepository.update(profile);
  }
}
