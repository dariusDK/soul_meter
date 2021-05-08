import 'package:loading_animations/loading_animations.dart';
import 'package:flutter/material.dart';

class LoadingBox extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return Container(
          child: LoadingFlipping.circle(
  borderColor: Colors.cyan,
  borderSize: 3.0,
  size: 30.0,
  backgroundColor: Colors.cyanAccent,
  duration: Duration(milliseconds: 500),
),
    );
      
  }
}