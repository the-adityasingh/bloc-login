import 'dart:async';
import 'validators.dart';

class Bloc with Validators {
  final _phone = StreamController<String>();
  final _password = StreamController<String>();

  //Add data to stream
  Stream<String> get phone => _phone.stream.transform(validatePhone);
  Stream<String> get password => _password.stream.transform(validatePassword);

  //Change data
  Function(String) get changePhone => _phone.sink.add;
  Function(String) get changePassword => _password.sink.add;

  dispose() {
    _phone.close();
    _password.close();
  }
}

final bloc = Bloc();
