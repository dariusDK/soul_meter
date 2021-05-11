import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:soul_meter/constants/constants.dart';
import 'package:soul_meter/functions/basic_functions.dart';
import 'package:soul_meter/widgets/loading_box/loading_box.dart';

class SteamHomeAppbarButton extends StatelessWidget {
  final String collectionPath;
  SteamHomeAppbarButton(this.collectionPath);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection(this.collectionPath)
            .doc(auth.currentUser.email)
            .snapshots(includeMetadataChanges: true),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Visibility(
              visible: snapshot.data.data()["status"],
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Tooltip(
                    message: !snapshot.data.data()["status"]
                        ? "not available"
                        : "burası dolacak",
                    child: Text(
                      'Steam',
                      style: TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontSize: 0.035 * MediaQuery.of(context).size.height),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                          colors: <Color>[Colors.grey, Colors.blueGrey]),
                    ),
                    height: 150,
                    margin: EdgeInsets.all(30.0),
                    textStyle: TextStyle(
                      fontSize: 24,
                    ),
                    showDuration: Duration(seconds: 2),
                    waitDuration: Duration(seconds: 1),
                  ),
                ),
              ),
            );
          }
          return LoadingBox();
        });
  }
}
