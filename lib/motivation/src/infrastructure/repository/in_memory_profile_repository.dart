import 'package:chores_app/motivation/src/domain/model/profile.dart';
import 'package:chores_app/motivation/src/domain/repository/profile_repository.dart';
import 'package:rxdart/rxdart.dart';

class InMemoryProfileRepository implements ProfileRepository {
  final BehaviorSubject<Map<String, Profile>> _subject = BehaviorSubject.seeded({});

  InMemoryProfileRepository() {
    final profiles = Map<String, Profile>.fromIterable([
      Profile(id: 'sophia'),
      Profile(id: 'alex'),
      Profile(id: 'bruce'),
      Profile(id: 'kate'),
    ], key: (c) => c.id, value: (c) => c);
    _subject.add(profiles);
  }

  @override
  Stream<List<Profile>> getByIds(List<String> ids) {
    return _subject.stream.map((map) => List<Profile>.unmodifiable(map.values));
  }

  @override
  Future<Profile> getById(String id) async {
    return getByIds([]).map((all) => all.firstWhere((c) => c.id == id)).first;
  }

  @override
  Future<void> update(Profile profile) async {
    final current = _subject.value;
    current[profile.id] = profile;
    _subject.add(Map.from(current));
  }
}
