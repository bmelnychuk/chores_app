import 'package:chores_app/motivation/src/domain/model/chore.dart';
import 'package:chores_app/motivation/src/domain/repository/chore_repository.dart';
import 'package:rxdart/rxdart.dart';

class InMemoryChoreRepository implements ChoreRepository {
  final BehaviorSubject<List<Chore>> _subject = BehaviorSubject.seeded([]);

  InMemoryChoreRepository() {
    final chores = [
      Chore(id: 'chore1', reward: 15),
      Chore(id: 'chore2', reward: 25),
      Chore(id: 'chore3', reward: 8),
    ];
    _subject.add(chores);
  }

  @override
  Stream<List<Chore>> getByIds(List<String> ids) {
    return _subject.stream;
  }

  @override
  Future<void> update(Chore chore) async {
    final newList = List<Chore>.unmodifiable([..._subject.value, chore]);
    _subject.add(newList);
  }

  @override
  Future<Chore> getById(String id) {
    return getByIds([]).map((all) => all.firstWhere((c) => c.id == id)).first;
  }
}
