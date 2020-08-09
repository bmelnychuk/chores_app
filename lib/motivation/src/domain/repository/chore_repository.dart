import 'package:chores_app/motivation/src/domain/model/chore.dart';

abstract class ChoreRepository {
  Stream<List<Chore>> getByIds(List<String> ids);
  Future<Chore> getById(String id);
  Future<void> update(Chore chore);
}
