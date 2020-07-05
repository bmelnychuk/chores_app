import 'package:chores_app/chores/src/domain/model/chore.dart';
import 'package:chores_app/chores/src/domain/repository/chore_repository.dart';
import 'package:rxdart/rxdart.dart';

class InMemoryChoreRepository implements ChoreRepository {
  final BehaviorSubject<List<Chore>> _subject = BehaviorSubject.seeded([]);

  InMemoryChoreRepository() {
    _fetchData();
  }

  @override
  Stream<List<Chore>> getFamilyChores() {
    return _subject.stream;
  }

  @override
  Stream<List<Chore>> getByIds(List<String> ids) {
    return _subject.stream;
  }

  @override
  Future<void> add(Chore chore) async {
    final newList = List<Chore>.unmodifiable([..._subject.value, chore]);
    _subject.add(newList);
  }

  Future<void> _fetchData() async {
    final chores = [
      Chore(
        id: 'chore1',
        dueDate: DateTime.now(),
        assigneeId: 'sophia',
        description: 'Wash clothes and put them away',
      ),
      Chore(
        id: 'chore2',
        dueDate: DateTime.now().subtract(Duration(days: 2)),
        assigneeId: 'alex',
        description: 'Clean the tub and shower walls',
      ),
      Chore(
        id: 'chore3',
        assigneeId: 'alex',
        dueDate: DateTime.now().subtract(Duration(days: 2)),
        description: 'Take out the trash',
      )
    ];
    _subject.add(chores);
  }
}
