import 'package:flutter/material.dart';

class DataHeaderWidget extends StatelessWidget {
  String data;
  DataHeaderWidget(String data) {
    this.data = data;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 50),
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: Text(
        data,
        style: TextStyle(fontSize: 36),
        textAlign: TextAlign.center,
      ),
    );
  }
}
