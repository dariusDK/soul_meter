import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:soul_meter/constants/constants.dart';
import 'package:soul_meter/widgets/text_boxs/default_text_box.dart';

class ProfileSettingsWidget extends StatelessWidget {
  final emailTextWidget = DefaultTextBoxWidget("e-mail", Icons.mail, false);
  final passwordTextWidget = DefaultTextBoxWidget("password", Icons.lock, true);
  final nickNameTextWidget =
      DefaultTextBoxWidget("nick name", Icons.account_box, false);
  final passwordAgainTextWidget =
      DefaultTextBoxWidget("password again", Icons.lock, true);

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
              nickNameTextWidget,
              emailTextWidget,
              passwordTextWidget,
              passwordAgainTextWidget,
            ],
          ),
          Divider(
            color: Colors.white,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text("Spotify"),
            style: spotifyButtonDecoration,
          ),
          DefaultTextBoxWidget(
              "Steam Profile URL", Icons.ac_unit_outlined, false),
          Divider(
            color: Colors.white,
          ),
          Container(
            //margin: EdgeInsets.only(bottom: 65),
            child: ElevatedButton(
                style: defaultButtonDecoration,
                onPressed: () {
                  auth.signOut().then((value) {
                    isGetStartedSelected.notifyListeners();
                  });
                },
                child: Text("Log Out")),
          ),
        ],
      )),
    );
  }
}
