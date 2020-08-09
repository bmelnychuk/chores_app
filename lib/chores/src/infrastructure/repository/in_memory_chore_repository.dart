import 'package:chores_app/chores/src/domain/event/chore_event.dart';
import 'package:chores_app/chores/src/domain/model/chore.dart';
import 'package:chores_app/chores/src/domain/repository/chore_repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uuid/uuid.dart';

class InMemoryChoreRepository implements ChoreRepository {
  final BehaviorSubject<Map<String, Chore>> _subject = BehaviorSubject.seeded({});
  final Subject<ChoreEvent> choreSubject;

  InMemoryChoreRepository(this.choreSubject) {
    _fetchData();
  }

  @override
  Stream<List<Chore>> getFamilyChores() {
    return _subject.stream.map((map) => List<Chore>.unmodifiable(map.values));
  }

  @override
  Stream<List<Chore>> getByIds(List<String> ids) {
    return getFamilyChores();
  }

  @override
  Future<void> add(Chore chore) async {
    final current = _subject.value;
    if (_wasResolved(current[chore.id], chore)) {
      choreSubject.add(ChoreDone(
        eventId: Uuid().v4(),
        choreId: chore.id,
        eventDate: DateTime.now(),
        assigneeId: chore.assigneeId,
      ));
    }
    current[chore.id] = chore;
    _subject.add(Map.from(current));
  }

  bool _wasResolved(Chore existing, Chore newChore) {
    if (existing == null) return false;
    return existing.status == Status.IN_PROGRESS && newChore.status == Status.DONE;
  }

  Future<void> _fetchData() async {
    final chores = Map<String, Chore>.fromIterable([
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
    ], key: (c) => c.id, value: (c) => c);
    _subject.add(chores);
  }
}
