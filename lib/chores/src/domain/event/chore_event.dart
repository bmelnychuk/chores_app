import 'package:meta/meta.dart';

class ChoreEvent {
  final String eventId;
  final DateTime eventDate;
  final String choreId;

  ChoreEvent({
    @required this.eventId,
    @required this.choreId,
    @required this.eventDate,
  });
}

class ChoreDone extends ChoreEvent {
  final String assigneeId;

  ChoreDone({
    @required String eventId,
    @required String choreId,
    @required DateTime eventDate,
    @required this.assigneeId,
  }) : super(eventId: eventId, choreId: choreId, eventDate: eventDate);
}
