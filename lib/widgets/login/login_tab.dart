import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:soul_meter/constants/constants.dart';
import 'package:soul_meter/functions/basic_functions.dart';
import 'package:soul_meter/widgets/dialogs/error_dialog.dart';
import 'package:soul_meter/widgets/text_boxs/default_text_box.dart';

class LoginTab extends StatefulWidget {
  @override
  _LoginTabState createState() => _LoginTabState();
}

class _LoginTabState extends State<LoginTab> {
  final emailTextWidget = DefaultTextBoxWidget("e-mail", Icons.mail, false);
  final passwordTextWidget = DefaultTextBoxWidget("password", Icons.lock, true);
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              emailTextWidget,
              passwordTextWidget,
            ],
          ),
          Container(
              //margin: EdgeInsets.only(top: 20),
              child: RoundedLoadingButton(
            child: Text('Login', style: TextStyle(color: Colors.white)),
            controller: _btnController,
            onPressed: () {
              login(emailTextWidget.getText, passwordTextWidget.getText)
                  .then((value) {
                if (value.isEmpty) {
                  isGetStartedSelected.notifyListeners();
                  scrollController.animateTo(
                      scrollController.offset +
                          MediaQuery.of(context).size.height,
                      curve: Curves.linear,
                      duration: Duration(milliseconds: 500));
                } else
                  showDialog(
                      context: context,
                      builder: (context) => ShowErrorDialog(value));
              });
            },
          ))
        ],
      ),
    );
  }
}
