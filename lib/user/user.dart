import 'package:soul_meter/functions/basic_functions.dart';

class User {
  String _userName;
  String _mail;

  User(String email, String userName) {
    this._mail = email;
    this._userName = userName;
  }
  Map<String, dynamic> get toMap {
    return {"email": this._mail, "user_name": this._userName};
  }
}
