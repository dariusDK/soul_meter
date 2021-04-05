import 'package:flutter/material.dart';

class HomeAppbarButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Tooltip(
          message: 'Spotify Datas',
          child: Text(
            'Spotify',
            style: TextStyle(
                color: Colors.black,
                decoration: TextDecoration.none,
                fontSize: 0.035 * MediaQuery.of(context).size.height),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            gradient: LinearGradient(colors: <Color>[Colors.red, Colors.amber]),
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
    );
  }
}
