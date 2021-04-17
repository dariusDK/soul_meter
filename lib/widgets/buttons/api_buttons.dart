import 'dart:html';

import 'package:flutter/material.dart';
import 'package:soul_meter/constants/constants.dart';
import 'package:soul_meter/functions/api_functions.dart';
import 'dart:js' as js;

class ApiButtonWidget extends StatefulWidget {
  final String title;

  const ApiButtonWidget(
    this.title,
  );

  @override
  _ApiButtonWidgetState createState() => _ApiButtonWidgetState();
}

class _ApiButtonWidgetState extends State<ApiButtonWidget> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            child: Text(widget.title),
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              fixedSize: Size(MediaQuery.of(context).size.width / 8,
                  MediaQuery.of(context).size.height / 20),
            ),
            onPressed: () {
              setState(() {
                //checked = isAuthCompleted(widget.title);
                var result = js.context.callMethod('open', [
                  'https://accounts.spotify.com/authorize?client_id=f1c7433d34324ec5bd7edc2885ea0e5c&response_type=code&redirect_uri=https://sbe.cu.edu.tr&scope=user-read-private%20user-read-email%20user-top-read&state=34fFs29kd09'
                ]);
              });
            },
          ),
          Checkbox(
              value: checked,
              checkColor: Colors.white,
              activeColor: Colors.lightBlueAccent,
              onChanged: (bool value) {})
        ],
      ),
    );
  }

  bool isAuthCompleted(String title) {
    if (title == "Spotify") {
      if (getSpotifyAuthCode() != null) {
        isSpotifySelected.value = true;
        return true;
      }
    }
    if (title == "Netflix") {}
    if (title == "Steam") {}
  }
}
