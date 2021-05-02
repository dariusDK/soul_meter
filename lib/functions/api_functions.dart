import 'dart:js' as js;

import 'package:soul_meter/constants/constants.dart';
import 'package:soul_meter/functions/basic_functions.dart';

Future<bool> getSpotifyAuthCode() async {
  dynamic obj = js.context.callMethod("open", [
    "${spAuthUrl}?client_id=${spClientID}&response_type=${spResponseType}&redirect_uri=${spRedirectUrl}&scope=${spScope}&state=${userEmail}"
  ]);
}
