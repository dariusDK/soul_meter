import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:soul_meter/constants/constants.dart';
import 'package:soul_meter/functions/api_functions.dart';

class SpotifyProfileButton extends StatefulWidget {
  @override
  _SpotifyProfileButtonState createState() => _SpotifyProfileButtonState();
}

class _SpotifyProfileButtonState extends State<SpotifyProfileButton> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection("spotify-data")
            .doc(auth.currentUser.email)
            .snapshots(includeMetadataChanges: true),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            try {
              return IconButton(
                onPressed: () {
                  if (snapshot.data
                      .data()["spotify_basic_data"]
                      .containsKey("error")) {
                    getSpotifyAuthCode();
                  } else {}
                },
                icon: Image.network(
                    snapshot.data.data()["spotify_basic_data"]["image"]),
                iconSize: 90,
              );
            } catch (e) {
              return IconButton(
                onPressed: () {
                  if (snapshot.data
                      .data()["spotify_basic_data"]
                      .containsKey("error")) {
                    getSpotifyAuthCode();
                  } else {}
                },
                icon: Image.asset('assets/images/Spotify_icon.png'),
                iconSize: 90,
              );
            }
          }
          return IconButton(
            onPressed: () {
              if (snapshot.data
                  .data()["spotify_basic_data"]
                  .containsKey("error")) {
                getSpotifyAuthCode();
              }
            },
            icon: Image.asset('assets/images/Spotify_icon.png'),
            iconSize: 90,
          );
        });
  }
}
