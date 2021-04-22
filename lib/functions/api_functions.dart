import 'package:flutter/services.dart';
import 'dart:js' as js;

import 'package:soul_meter/constants/constants.dart';

Future<bool> getSpotifyAuthCode() async {
  dynamic obj = js.context.callMethod("open", [
    "${spAuthUrl}?client_id=${spClientID}&response_type=${spResponseType}&redirect_uri=${spRedirectUrl}&scope=${spScope}&state=${userEmail}"
  ]);
}
