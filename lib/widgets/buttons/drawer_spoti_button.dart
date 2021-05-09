import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:soul_meter/constants/constants.dart';
import 'package:soul_meter/widgets/loading_box/loading_box.dart';

class DrawerspotiButton extends StatelessWidget {
  final String collectionPath;
  DrawerspotiButton(this.collectionPath);

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
              child: ExpansionTile(
                title: Text(
                  'Spotify',
              style: TextStyle(fontSize: 16,color: Colors.black),
              
              ),
              backgroundColor: Colors.green[200],
            trailing: Icon(Icons.arrow_drop_down),
              leading: Image.asset("assets/images/ozan.ico"),
              children: [ 
                
                Text("data"),
              ],)
            );
          }
          return LoadingBox();
        });
  }
}
