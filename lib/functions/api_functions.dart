import 'dart:convert';
import 'dart:io';
import 'dart:js' as js;
import 'package:http/http.dart' as http;
import 'package:soul_meter/constants/constants.dart';

Future<bool> getSpotifyAuthCode() async {
  print("email = " + userEmail);
  dynamic obj = js.context.callMethod("open", [
    "${spAuthUrl}?client_id=${spClientID}&response_type=${spResponseType}&redirect_uri=${spRedirectUrl}&scope=${spScope}&state=${auth.currentUser.email}"
  ]);
}

Future<String> fetchSteamProfilePic(String steamId) async {
  print(
      'http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=${steamAPI}&steamids=${steamId}');
  dynamic steamData = await http.get(
      Uri.parse(
          'http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=${steamAPI}&steamids=${steamId}'),
      headers: {'Access-Control-Allow-Origin': '*'});
  dynamic data;
  return jsonDecode(steamData)['response']["players"][0]['avatarfull'];
}
