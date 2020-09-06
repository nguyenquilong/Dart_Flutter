import "dart:async";
import './validator.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Object with Validator {
  final _email = new StreamController<String>.broadcast();
  final _password = new StreamController<String>.broadcast();

  // add data to stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);
  Stream<bool> get submit => Rx.combineLatest2(email, password, (e, p) => true);

  // change data
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  dispose() {
    _email.close();
    _password.close();
  }
}

final bloc = Bloc();
