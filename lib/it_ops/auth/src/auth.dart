import 'package:chores_app/it_ops/auth/src/session.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uuid/uuid.dart';

class Auth {
  static final Auth _instance = Auth._();

  static Auth get instance => _instance;

  final BehaviorSubject<Session> _sessionSubject = BehaviorSubject.seeded(Session.loggedIn(Uuid().v4()));

  Auth._();

  Stream<Session> get sessionStream => _sessionSubject.stream;
}
