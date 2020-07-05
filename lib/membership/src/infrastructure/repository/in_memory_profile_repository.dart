import 'package:chores_app/membership/src/domain/model/profile.dart';
import 'package:chores_app/membership/src/domain/repository/profile_repository.dart';
import 'package:rxdart/rxdart.dart';

class InMemoryProfileRepository implements ProfileRepository {
  final Subject<List<Profile>> _subject = BehaviorSubject.seeded([]);

  InMemoryProfileRepository() {
    _fetchData();
  }

  @override
  Stream<List<Profile>> getFamilyMembers() {
    return _subject.stream;
  }

  Future<void> _fetchData() async {
    final profiles = [
      Profile(id: 'sophia', name: 'Sophia', picture: 'https://i.pravatar.cc/150?u=sophia'),
      Profile(id: 'alex', name: 'Alex', picture: 'https://i.pravatar.cc/150?u=alex'),
      Profile(id: 'bruce', name: 'Bruce', picture: 'https://i.pravatar.cc/150?u=bruce'),
      Profile(id: 'kate', name: 'Kate', picture: 'https://i.pravatar.cc/150?u=kate'),
    ];
    _subject.add(profiles);
  }
}
