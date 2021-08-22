import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:soul_meter/constants/constants.dart';
import 'package:soul_meter/functions/api_functions.dart';

class SteamProfileButton extends StatefulWidget {
  @override
  _SteamProfileButtonState createState() => _SteamProfileButtonState();
}

class _SteamProfileButtonState extends State<SteamProfileButton> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection("steam-data")
            .doc(auth.currentUser.email)
            .snapshots(includeMetadataChanges: true),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            try {
              return IconButton(
                onPressed: () {
                  if (snapshot.data.data()["basic_data"].containsKey("error")) {
                    lateSteamUrl.value = !lateSteamUrl.value;
                  }
                },
                icon: Image.asset(
                  'assets/images/steam.png',
                ),
                iconSize: 150,
              );
            } catch (e) {
              return IconButton(
                onPressed: () {
                  if (snapshot.data.data()["basic_data"].containsKey("error")) {
                    lateSteamUrl.value = !lateSteamUrl.value;
                  }
                },
                icon: Image.asset(
                  'assets/images/steam.png',
                ),
                iconSize: 100,
              );
            }
          }
          return IconButton(
            onPressed: () {
              if (snapshot.data.data()["basic_data"].containsKey("error")) {
                lateSteamUrl.value = !lateSteamUrl.value;
              }
            },
            icon: Image.asset(
              'assets/images/steam.png',
            ),
            iconSize: 150,
          );
        });
  }
}
