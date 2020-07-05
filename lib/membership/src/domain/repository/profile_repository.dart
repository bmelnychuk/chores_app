import 'package:chores_app/membership/src/domain/model/profile.dart';

abstract class ProfileRepository {
  Stream<List<Profile>> getFamilyMembers();
}
