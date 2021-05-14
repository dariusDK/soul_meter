import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:soul_meter/constants/constants.dart';
import 'package:soul_meter/widgets/loading_box/loading_box.dart';

class ResultDesktopBox extends StatefulWidget {
  @override
  _ResultDesktopBoxState createState() => _ResultDesktopBoxState();
}

class _ResultDesktopBoxState extends State<ResultDesktopBox> {
  bool _isAnimationStop = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ValueListenableBuilder(
          valueListenable: isRatingStart,
          builder: (BuildContext context, bool isRatingStarted, Widget child) {
            return Visibility(
              visible: isRatingStarted,
              child: ValueListenableBuilder(
                valueListenable: isRatingOver,
                builder:
                    (BuildContext context, bool isWaitingOver, Widget child) {
                  return !isWaitingOver
                      ? LoadingBox()
                      : CircularPercentIndicator(
                          animation: true,
                          percent: rateResult.value,
                          radius: 200,
                          lineWidth: 15,
                          linearGradient: LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              colors: [Colors.green, Colors.yellow]),
                          backgroundColor: Colors.grey,
                          animationDuration: 1500,
                          center: Visibility(
                            visible: _isAnimationStop,
                            child: Text(
                              (rateResult.value * 100).toStringAsFixed(2),
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                          onAnimationEnd: () {
                            setState(() {
                              _isAnimationStop = true;
                            });
                          },
                        );
                },
              ),
            );
          }),
    );
  }
}
