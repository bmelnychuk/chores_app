import 'package:meta/meta.dart';

class Profile {
  final String id;
  final int totalScore;

  Profile({
    @required this.id,
    this.totalScore = 0,
  });
}
