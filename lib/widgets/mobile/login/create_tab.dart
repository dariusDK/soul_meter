import 'package:flutter/material.dart';
import 'package:soul_meter/constants/constants.dart';
import 'package:soul_meter/functions/basic_functions.dart';
import 'package:soul_meter/widgets/text_boxs/default_text_box.dart';

class CreateTab extends StatelessWidget {
  final emailTextWidget = DefaultTextBoxWidget("e-mail", Icons.mail, false);
  final passwordTextWidget = DefaultTextBoxWidget("password", Icons.lock, true);
  final nickNameTextWidget =
      DefaultTextBoxWidget("nick name", Icons.account_box, false);
  final passwordAgainTextWidget =
      DefaultTextBoxWidget("password again", Icons.lock, true);
  bool _isCreateAccount = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              nickNameTextWidget,
              emailTextWidget,
              passwordTextWidget,
              passwordAgainTextWidget,
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 65),
            child: ElevatedButton(
                style: defaultButtonDecoration,
                onPressed: () {
                  createAccount(
                      nickNameTextWidget.getText,
                      emailTextWidget.getText,
                      passwordTextWidget.getText,
                      passwordAgainTextWidget.getText);
                },
                child: Text("Create Account")),
          )
        ],
      ),
    );
  }
}
