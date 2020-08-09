import 'package:chores_app/motivation/src/domain/model/chore.dart';
import 'package:meta/meta.dart';

class Profile {
  final String id;
  final List<ChoreDone> events = [];

  Profile({
    @required this.id,
  });

  void resolveChore(Chore chore) {
    events.add(ChoreDone(
      choreId: chore.id,
      reward: chore.reward,
    ));
  }

  int get totalScore {
    return events.fold<int>(0, (res, change) => res + change.reward);
  }
}

class ChoreDone {
  final String choreId;
  final int reward;

  ChoreDone({
    @required this.choreId,
    @required this.reward,
  });
}
