import 'package:meta/meta.dart';

class Chore {
  final String id;
  final int reward;

  Chore({
    @required this.id,
    this.reward = 0,
  });
}
