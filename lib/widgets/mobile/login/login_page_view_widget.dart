import 'package:flutter/material.dart';
import 'package:soul_meter/constants/constants.dart';
import 'package:soul_meter/widgets/desktop/login/login_desktop_box.dart';
import 'package:soul_meter/widgets/mobile/login/create_tab.dart';
import 'package:soul_meter/widgets/mobile/login/login_tab.dart';

class LoginPageViewWidget extends StatelessWidget {
  final PageController pageViewController;
  LoginPageViewWidget(this.pageViewController);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(left: 30, right: 30, bottom: 160),
        child: Container(
          decoration: loginBoxDecoration,
          child: PageView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            controller: pageViewController,
            children: <Widget>[
              LoginTab(),
              CreateTab(),
            ],
          ),
        ),
      ),
    );
  }
}
