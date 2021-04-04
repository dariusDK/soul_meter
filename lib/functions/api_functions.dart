import 'package:flutter/services.dart';
import 'package:spotify_sdk/spotify_sdk.dart';

Future<bool> getSpotifyAuthCode() async {
  String URL_AUTH = 'https://accounts.spotify.com/de/authorize';
  String ClientId = 'f1c7433d34324ec5bd7edc2885ea0e5c';
  String redirectUrl = 'https://server-side-308019.web.app/#/';

  String response_type = 'code';
  String scope =
      'user-read-private%20user-read-email%20user-top-read%20user-library-read';
  var authenticationToken;
  try {
    authenticationToken = await SpotifySdk.getAuthenticationToken(
        clientId: ClientId,
        redirectUrl: redirectUrl,
        scope: scope,
        asRadio: false);
  } on PlatformException catch (e) {
    print("platform hatası");
  } on MissingPluginException catch (e) {
    print("plugin hatası");
  }
  return authenticationToken;
}
