import 'package:flutter/services.dart';
import 'package:spotify_sdk/spotify_sdk.dart';

Future<bool> getSpotifyAuthCode() async {
  String URL_AUTH = 'https://accounts.spotify.com/de/authorize';
  String ClientId = 'f1c7433d34324ec5bd7edc2885ea0e5c';
  String redirectUrl = 'https://sbe.cu.edu.tr';

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
    print(authenticationToken.toString());
  } on PlatformException catch (e) {
    print("platform hatası");
  } on MissingPluginException catch (e) {
    print("plugin hatası");
  }
  return authenticationToken;
}
//code=AQC2hjusVvLS0gfhfW3yfq51eUotmNvFECa6-JBCRwe8n5FhRYDk62wi7SjAoiBOmZnCAIviQRV1Uh2SL89hcp8GOpGl5_CqYjRxr6V0lKQZ4JJdALV-QvxvrKU3-odEkpltormdtYHDM_zuAOQ41FpYUZqNF7dsS5BQAZc06MBAU2np0iE8bSt01BI0zTdmEMkJfPcV98kmbbSNUoPDoOFpJJWg4Lpb8rL5BDaffE2xR7YUnbZVGIJ4ej4n07usBd5hXd_BluFOw5mDmf1Ov2E9uEU5RphlWOvAFx_KESeGT9cCDcUdzjsO7X_JxEPm_90BI0OXVZYyX9ethrD3SyEGf1p-neDLJoYcxQ-Voq_3HPnVFsHdXyaVa07kbosdcITtTJ79d9PMJYctMGxss8gOfsgu1Uy--eOeQejJJt4wyRHnMZuOI-OAzm6n9kgpJOSSts8mKw