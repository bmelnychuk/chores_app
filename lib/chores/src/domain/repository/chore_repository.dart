import 'package:chores_app/chores/src/domain/model/chore.dart';

abstract class ChoreRepository {
  Stream<List<Chore>> getFamilyChores();
  Stream<List<Chore>> getByIds(List<String> ids);
  Future<void> add(Chore chore);
}