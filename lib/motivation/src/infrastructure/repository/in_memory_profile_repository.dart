import 'package:chores_app/motivation/src/domain/model/profile.dart';
import 'package:chores_app/motivation/src/domain/repository/profile_repository.dart';
import 'package:rxdart/rxdart.dart';

class InMemoryProfileRepository implements ProfileRepository {
  final Subject<List<Profile>> _subject = BehaviorSubject.seeded([]);

  InMemoryProfileRepository() {
    final profiles = [
      Profile(id: 'sophia', totalScore: 96),
      Profile(id: 'alex', totalScore: 12),
      Profile(id: 'bruce', totalScore: 25),
      Profile(id: 'kate', totalScore: 60),
    ];
    _subject.add(profiles);
  }

  @override
  Stream<List<Profile>> getByIds(List<String> ids) {
    return _subject.stream;
  }
}
