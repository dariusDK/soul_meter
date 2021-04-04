import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ResultDesktopBox extends StatefulWidget {
  String deneme = "70%";
  bool goster = false;
  @override
  _ResultDesktopBoxState createState() => _ResultDesktopBoxState();
}

class _ResultDesktopBoxState extends State<ResultDesktopBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CircularPercentIndicator(
        animation: true,
        percent: 0.7,
        radius: 200,
        lineWidth: 15,
        linearGradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [Colors.green, Colors.yellow]),
        backgroundColor: Colors.grey,
        animationDuration: 1500,
        center: Visibility(
          visible: widget.goster,
          child: Text(
            widget.deneme,
            style: TextStyle(fontSize: 24),
          ),
        ),
        onAnimationEnd: () {
          setState(() {
            widget.goster = true;
          });
        },
      ),
    );
  }
}
