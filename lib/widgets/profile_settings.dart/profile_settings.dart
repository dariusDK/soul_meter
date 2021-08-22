import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:soul_meter/constants/constants.dart';
import 'package:soul_meter/functions/basic_functions.dart';
import 'package:soul_meter/widgets/buttons/spotify_profile.dart';
import 'package:soul_meter/widgets/buttons/steam_profile.dart';
import 'package:soul_meter/widgets/dialogs/error_dialog.dart';
import 'package:soul_meter/widgets/text_boxs/default_text_box.dart';

class ProfileSettingsWidget extends StatefulWidget {
  @override
  _ProfileSettingsWidgetState createState() => _ProfileSettingsWidgetState();
}

class _ProfileSettingsWidgetState extends State<ProfileSettingsWidget> {
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();
  final steamUrlTextWidget =
      DefaultTextBoxWidget("Steam Profile URL", Icons.ac_unit_outlined, false);
  bool _checked = true;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection("user")
            .doc(auth.currentUser.email)
            .snapshots(includeMetadataChanges: true),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
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
                        style: TextStyle(color: Colors.grey[300], fontSize: 36),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 200,
                            child: Text(
                              snapshot.data.data()["user_name"],
                              style: TextStyle(
                                  color: Colors.grey[300], fontSize: 24),
                              textAlign: TextAlign.center,
                            ),
                            /*TextField(
                          //enabled: !_checked,
                          decoration: InputDecoration(
                              hintText: "merhaba",
                              hintStyle:
                                  TextStyle(color: Colors.black, fontSize: 24)),
                        ),*/
                          ),
                          /* Checkbox(
                          value: _checked,
                          onChanged: (newValue) {
                            setState(() {
                              _checked = newValue;
                            });
                          })*/
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [SteamProfileButton(), SpotifyProfileButton()],
                  ),
                  ValueListenableBuilder<bool>(
                      valueListenable: lateSteamUrl,
                      builder:
                          (BuildContext context, bool result, Widget widget) {
                        return Visibility(
                          visible: result,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              steamUrlTextWidget,
                              IconButton(
                                onPressed: () {
                                  if (isValidSteamURL(
                                      steamUrlTextWidget.getText)) {
                                    saveSteamUrlToDB(steamUrlTextWidget.getText)
                                        .then((value) {
                                      if (value.isEmpty) {
                                        showDialog(
                                            context: context,
                                            builder: (context) =>
                                                ShowErrorDialog(
                                                    "Steam Has Connected"));
                                        isSteamConnected.value = true;
                                        steamUrlTextWidget.textEditingController
                                            .clear();
                                      } else {
                                        showDialog(
                                            context: context,
                                            builder: (context) => ShowErrorDialog(
                                                "Steam Has not Connected check your profile url"));
                                        isSteamConnected.value = false;
                                      }
                                    });
                                  } else {
                                    showDialog(
                                        context: context,
                                        builder: (context) => ShowErrorDialog(
                                            "Invalid Steam Url"));
                                  }
                                },
                                icon: Icon(Icons.check_circle_outline_rounded),
                                iconSize: 30,
                                color: Colors.blue[300],
                              )
                            ],
                          ),
                        );
                      }),
                  Container(
                      //margin: EdgeInsets.only(bottom: 65),
                      child: RoundedLoadingButton(
                    child:
                        Text('Log Out', style: TextStyle(color: Colors.white)),
                    controller: _btnController,
                    onPressed: () {
                      auth.signOut().then((value) {
                        isGetStartedSelected.value = false;
                        isSpotifyConnected.value = false;
                        isSteamConnected.value = false;
                        isAccountCreated = false;
                        hasAnySpotifyResult.value = false;
                        hasAnySteamResult.value = false;
                      });
                    },
                  )),
                ],
              )),
            );
          }
          return Text("Loading");
        });
  }
}
