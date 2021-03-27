import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:soul_meter/constants/constants.dart';
import 'package:soul_meter/widgets/buttons/login_button.dart';
import 'package:soul_meter/widgets/desktop/login/login_situation.dart';
import 'package:soul_meter/widgets/text_box/default_text_box.dart';

class LoginBoxWidget extends StatefulWidget {
  @override
  _LoginBoxWidgetState createState() => _LoginBoxWidgetState();
}

class _LoginBoxWidgetState extends State<LoginBoxWidget> {
  final emailTextWidget = DefaultTextBoxWidget("e-mail", Icons.mail, false);
  final passwordTextWidget = DefaultTextBoxWidget("password", Icons.lock, true);
  final nickNameTextWidget =
      DefaultTextBoxWidget("nick name", Icons.mail, false);
  final passwordAgainTextWidget =
      DefaultTextBoxWidget("password again", Icons.lock, true);
  bool _isCreateAccount = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        height: 700,
        width: 500,
        child: Container(
          child: Column(
            children: [
              LoginSituationWidget(situation),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                      visible: _isCreateAccount,
                      child: nickNameTextWidget,
                    ),
                    Visibility(
                      child: emailTextWidget,
                    ),
                    Visibility(
                      child: passwordTextWidget,
                    ),
                    Visibility(
                      visible: _isCreateAccount,
                      child: passwordAgainTextWidget,
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: Text(
                      loginButtonText,
                    ),
                    onPressed: () {
                      _isCreateAccount
                          ? createAccount(
                              nickNameTextWidget.getText,
                              emailTextWidget.getText,
                              passwordTextWidget.getText,
                              passwordAgainTextWidget.getText)
                          : login(emailTextWidget.getText,
                              passwordTextWidget.getText);
                    },
                    style: defaultButtonDecoration,
                  ),
                ],
              ),
              GestureDetector(
                child: Container(
                    padding: EdgeInsets.all(45),
                    child: Text(
                      createSituation,
                      style: clickableText,
                    )),
                onTap: () {
                  setState(() {
                    _isCreateAccount = !_isCreateAccount;
                    createSituation =
                        _isCreateAccount ? "Login" : "Create Account";
                    situation = !_isCreateAccount ? "Login" : "Create Account";
                    loginButtonText =
                        !_isCreateAccount ? "Login" : "Create Account";
                  });
                },
              )
            ],
          ),
          decoration: BoxDecoration(color: loginBoxColor),
        ),
      ),
    );
  }

  void login(String email, String password) {
    if (email.contains("@") && email.contains(".")) {
      //pop up benzeri gelelbilir hataları yazmak için
      if (password.length > 5) {}
    }
  }

  void createAccount(
      String nickName, String email, String password, String passwordAgain) {
    if (email.contains("@") && email.contains(".")) {
      print("mail");
      //pop up benzeri gelelbilir hataları yazmak için
      if (password.length > 5 && password == passwordAgain) {
        print("pass");
        if (nickName.length > 3) {}
      }
    }
  }
}
