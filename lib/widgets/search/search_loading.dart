import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:soul_meter/constants/constants.dart';

class SearchLoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      child: ValueListenableBuilder<bool>(
          valueListenable: isLoading,
          builder: (BuildContext context, bool result, Widget widget) {
            return Visibility(
                visible: isLoading.value,
                child: Lottie.asset('images/rocket.json'));
          }),
    );
  }
}
