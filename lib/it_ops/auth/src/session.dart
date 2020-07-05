import 'package:meta/meta.dart';

enum Status { uninitialized, loggedIn, loggedOut }

class Session {
  final String userId;
  final Status status;

  factory Session.unInitialized() {
    return Session._(status: Status.uninitialized);
  }

  factory Session.loggedIn(String userId) {
    return Session._(userId: userId, status: Status.loggedIn);
  }

  factory Session.loggedOut(String userId) {
    return Session._(status: Status.loggedOut);
  }

  Session._({@required this.status, this.userId});
}
