import 'dart:js' as js;

import 'package:soul_meter/constants/constants.dart';

Future<bool> getSpotifyAuthCode() async {
  print("email = " + userEmail);
  dynamic obj = js.context.callMethod("open", [
    "${spAuthUrl}?client_id=${spClientID}&response_type=${spResponseType}&redirect_uri=${spRedirectUrl}&scope=${spScope}&state=${auth.currentUser.email}"
  ]);
}
