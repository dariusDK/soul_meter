import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:soul_meter/constants/constants.dart';
import 'package:soul_meter/widgets/buttons/spotify_profile.dart';
import 'package:soul_meter/widgets/buttons/steam_profile.dart';

class ProfileSettingsWidget extends StatefulWidget {
  @override
  _ProfileSettingsWidgetState createState() => _ProfileSettingsWidgetState();
}

class _ProfileSettingsWidgetState extends State<ProfileSettingsWidget> {
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  bool _checked = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      /*padding: EdgeInsets.only(
        left: 30,
        right: 30,
      ),*/
      child: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text(
                "Welcome",
                style: TextStyle(fontSize: 36),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 200,
                    child: TextField(
                      enabled: !_checked,
                      decoration: InputDecoration(
                          hintText: "merhaba",
                          hintStyle:
                              TextStyle(color: Colors.black, fontSize: 24)),
                    ),
                  ),
                  Checkbox(
                      value: _checked,
                      onChanged: (newValue) {
                        setState(() {
                          _checked = newValue;
                        });
                      })
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [SteamProfileButton(), SpotifyProfileButton()],
          ),
          Container(
              //margin: EdgeInsets.only(bottom: 65),
              child: RoundedLoadingButton(
            child: Text('Log Out', style: TextStyle(color: Colors.white)),
            controller: _btnController,
            onPressed: () {
              auth.signOut().then((value) {
                isGetStartedSelected.value = false;
              });
            },
          )),
        ],
      )),
    );
  }
}
