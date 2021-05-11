import 'package:flutter/material.dart';
import 'package:soul_meter/constants/constants.dart';
import 'package:soul_meter/widgets/buttons/spotify_api_button.dart';
import 'package:soul_meter/widgets/buttons/steam_api_button.dart';

class ApiDesktopBox extends StatefulWidget {
  @override
  _ApiDesktopBoxState createState() => _ApiDesktopBoxState();
}

class _ApiDesktopBoxState extends State<ApiDesktopBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsetsDirectional.only(start: 20, end: 300, bottom: 70),
        width: MediaQuery.of(context).size.width / 6.5, //300
        height: MediaQuery.of(context).size.height / 3, //500
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SpotifyApiButtonWidget("Spotify"),
            SteamApiButtonWidget("Steam")
          ],
        ));
  }
}
