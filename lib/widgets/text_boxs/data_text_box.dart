import 'package:flutter/material.dart';
import 'package:soul_meter/constants/constants.dart';

class DataInfoTextBox extends StatelessWidget {
  String data1;
  String data2;
  String data3;
  String data4;
  String data5;
  DataInfoTextBox(
    String data1,
    String data2,
    String data3,
    String data4,
    String data5,
  ) {
    this.data1 = data1;
    this.data2 = data2;
    this.data3 = data3;
    this.data4 = data4;
    this.data5 = data5;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 7,
      width: MediaQuery.of(context).size.width / 6,
      //color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(data1,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.height / 60,
                  color: Colors.grey[500])),
          Text(data2,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.height / 60,
                  color: Colors.grey[500])),
          Text(data3,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.height / 60,
                  color: Colors.grey[500])),
          Text(data4,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.height / 60,
                  color: Colors.grey[500])),
          Text(data5,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.height / 60,
                  color: Colors.grey[500]))
        ],
      ),
    );
  }
}
