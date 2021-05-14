import 'package:loading_animations/loading_animations.dart';
import 'package:flutter/material.dart';

//https://pub.dev/packages/loading_animations
class LoadingBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: LoadingBouncingGrid.circle(
        borderColor: Colors.green,
        borderSize: 3.0,
        size: 30.0,
        duration: Duration(milliseconds: 5000),
      ),
    );
  }
}
