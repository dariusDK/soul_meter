import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:soul_meter/constants/constants.dart';
import 'package:soul_meter/functions/api_functions.dart';
import 'package:soul_meter/widgets/alert_box/error_box_alert.dart';
import 'package:soul_meter/widgets/alert_box/steam_link_input.dart';
import 'package:soul_meter/widgets/loading_box/loading_box.dart';

class SteamApiButtonWidget extends StatefulWidget {
  String title;

  SteamApiButtonWidget(String title) {
    this.title = title;
  }

  @override
  _SteamApiButtonWidgetState createState() => _SteamApiButtonWidgetState();
}

class _SteamApiButtonWidgetState extends State<SteamApiButtonWidget> {
  String mail = auth.currentUser.email;
  DocumentReference docRef = FirebaseFirestore.instance
      .collection("steam-data")
      .doc(auth.currentUser.email);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: docRef.snapshots(includeMetadataChanges: true),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print("hata oluştu");
            return Text("Error occured");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingBox();
          }

          widget.title = snapshot.data.data().containsKey("profile_link")
              ? "Steam"
              : "Connect Steam!";
          if (snapshot.hasData) {
            return Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: Text(snapshot.data.data().containsKey("profile_link")
                        ? "Steam"
                        : "Connect Steam!"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      minimumSize: Size(MediaQuery.of(context).size.width / 8,
                          MediaQuery.of(context).size.height / 20),
                    ),
                    onPressed: () {
                      isAuthCompleted(widget.title);
                    },
                  ),
                  Visibility(
                      visible: snapshot.data.data().containsKey("profile_link"),
                      child: Checkbox(
                          value: snapshot.data.data()["status"],
                          checkColor: Colors.white,
                          activeColor: Colors.lightBlueAccent,
                          onChanged: (bool value) {
                            if (snapshot.data.data() != null) {
                              var newData = snapshot.data.data();
                              newData["status"] = value;

                              FirebaseFirestore.instance
                                  .collection("steam-data")
                                  .doc(auth.currentUser.email)
                                  .set(newData);
                            }
                          }))
                ],
              ),
            );
          }
          return LoadingBox();
        });
  }

  Future<bool> isAuthCompleted(String title) async {
    if (title == "Connect Steam!") {
      showDialog(
          context: context,
          builder: (context) {
            return SteamLinkInputWidget();
          });
      isSteamSelected.value = !isSteamSelected.value;
      return true;
    }
  }
}
