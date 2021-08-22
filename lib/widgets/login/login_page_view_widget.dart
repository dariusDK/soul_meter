import 'package:flutter/material.dart';

import 'create_tab.dart';
import 'login_tab.dart';

class LoginPageViewWidget extends StatelessWidget {
  final PageController pageViewController;
  LoginPageViewWidget(this.pageViewController);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        /*padding: EdgeInsets.only(
          left: 30,
          right: 30,
        ),*/
        child: Container(
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
