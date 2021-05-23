import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:soul_meter/constants/constants.dart';

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
                onPressed: () {},
                icon: Image.network(snapshot.data.data()["me"]["images"][0]),
                iconSize: 50,
              );
            } catch (e) {
              return IconButton(
                onPressed: () {},
                icon: Image.asset(
                  'assets/images/Spotify_icon.png',
                ),
                iconSize: 50,
              );
            }
          }
          return IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/images/Spotify_icon.png',
            ),
            iconSize: 50,
          );
        });
  }
}
