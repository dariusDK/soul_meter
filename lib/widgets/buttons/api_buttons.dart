import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:soul_meter/constants/constants.dart';
import 'package:soul_meter/functions/api_functions.dart';

class ApiButtonWidget extends StatefulWidget {
  final String title;

  const ApiButtonWidget(
    this.title,
  );

  @override
  _ApiButtonWidgetState createState() => _ApiButtonWidgetState();
}

class _ApiButtonWidgetState extends State<ApiButtonWidget> {
  String mail = auth.currentUser.email;
  DocumentReference docRef = FirebaseFirestore.instance
      .collection("spotify-data")
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
            return Text("loading");
          }
          return Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: Text(snapshot.data.data().containsKey("access_token")
                      ? "Spotify"
                      : "Connect Spotify!"),
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
                    visible: snapshot.data.data().containsKey("access_token"),
                    child: Checkbox(
                        value: snapshot.data.data()["status"],
                        checkColor: Colors.white,
                        activeColor: Colors.lightBlueAccent,
                        onChanged: (bool value) {
                          if (snapshot.data.data() != null) {
                            var newData = snapshot.data.data();
                            newData["status"] = value;

                            FirebaseFirestore.instance
                                .collection("spotify-data")
                                .doc(auth.currentUser.email)
                                .set(newData);
                          }
                        }))
              ],
            ),
          );
        });
  }

  Future<bool> isAuthCompleted(String title) async {
    if (title == "Connect Spotify!") {
      //getSpotifyAuthCode();
      isSpotifySelected.value = !isSpotifySelected.value;
      return true;
    }
    if (title == "Netflix") {}
    if (title == "Steam") {}
  }
}
