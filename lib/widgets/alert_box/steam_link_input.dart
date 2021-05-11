import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:soul_meter/functions/basic_functions.dart';
import 'package:soul_meter/widgets/alert_box/error_box_alert.dart';

/*class SteamLinkInputWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blueGrey[900],
      title: Text(
        'Enter Your Steam Profile Url',
        style: TextStyle(color: Colors.grey[500]),
      ),
      content: TextField(),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {

            Navigator.of(context, rootNavigator: true).pop();
          },
          child: Text('OK'),
        ),
      ],
    );
  }
}*/

class SteamLinkInputWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
        backgroundColor: Colors.blueGrey[900],
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: 250,
              width: 500,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
                child: Column(
                  children: [
                    Text(
                      'Enter Your Steam Profile URL',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.grey[500]),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextField(
                      onSubmitted: (link) {
                        saveSteamUrlToDB(link).then((result) {
                          result.isEmpty
                              ? Navigator.of(context, rootNavigator: true).pop()
                              : ShowErrorDialog(result);
                        });
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                top: -50,
                child: CircleAvatar(
                    backgroundColor: Colors.redAccent,
                    radius: 60,
                    child: Image.asset(
                      "assets/images/steam.png",
                      fit: BoxFit.fill,
                    ))),
          ],
        ));
  }
}
