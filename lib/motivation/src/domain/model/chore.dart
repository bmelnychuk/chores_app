import 'package:meta/meta.dart';

class Chore {
  final String id;
  final int reward;

  Chore({
    @required this.id,
    int reward,
  }) : this.reward = reward ?? 0;
}
