import 'package:meta/meta.dart';

enum Status { IN_PROGRESS, DONE }

class Chore {
  final String id;
  final String description;
  final DateTime dueDate;
  final String assigneeId;
  final Status status;

  Chore({
    @required this.id,
    this.description,
    this.dueDate,
    this.assigneeId,
    this.status = Status.IN_PROGRESS,
  });
}
