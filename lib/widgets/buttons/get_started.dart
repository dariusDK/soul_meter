import 'package:flutter/material.dart';
import 'package:soul_meter/constants/constants.dart';
import 'package:soul_meter/widgets/dialogs/error_dialog.dart';

class GetStartedButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 13,
      width: MediaQuery.of(context).size.width / 5.5,
      child: TextButton(
          style: getStartedButtonDecoration,
          onPressed: () {
            isGetStartedSelected.value = true;
            if (auth.currentUser != null) {
              scrollController.animateTo(
                  scrollController.offset + MediaQuery.of(context).size.height,
                  curve: Curves.linear,
                  duration: Duration(milliseconds: 500));
            } else {
              showDialog(
                  context: context,
                  builder: (context) => ShowErrorDialog(
                      "before getting started you must login or create an account."));
            }
          },
          child: Text(
            "Get Started",
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width *
                    MediaQuery.of(context).size.height /
                    30000,
                color: Colors.grey[300]),
          )),
    );
  }
}
