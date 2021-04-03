import 'package:soul_meter/functions/basic_functions.dart';

class User {
  String _name;
  String _userName;
  String _mail;
  String _id;

  User(this._id, this._mail, this._name, this._userName);
  get userSpData {
    return getSpotifyData(this._id);
  }
}
