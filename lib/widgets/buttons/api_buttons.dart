import 'dart:html';

import 'package:flutter/material.dart';
import 'package:soul_meter/constants/constants.dart';
import 'package:soul_meter/functions/api_functions.dart';
import 'dart:js' as js;
import 'dart:convert';

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
              minimumSize: Size(MediaQuery.of(context).size.width / 8,
                  MediaQuery.of(context).size.height / 20),
            ),
            onPressed: () {
              setState(() {
                checked = isAuthCompleted(widget.title);
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
      getSpotifyAuthCode();
      isSpotifySelected.value = true;
      return true;
    }
    if (title == "Netflix") {}
    if (title == "Steam") {}
  }
}
