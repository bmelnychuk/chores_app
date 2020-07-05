import 'package:chores_app/motivation/src/domain/model/profile.dart';

abstract class ProfileRepository {
  Stream<List<Profile>> getByIds(List<String> ids);
}
