import 'package:meta/meta.dart';

class Chore {
  final String id;
  final String description;
  final DateTime dueDate;
  final String assigneeId;

  Chore({
    @required this.id,
    this.description,
    this.dueDate,
    this.assigneeId,
  });
}
