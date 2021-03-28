import 'package:flutter/material.dart';
import 'package:soul_meter/widgets/desktop/login/login_box.dart';
import 'package:soul_meter/widgets/mobile/login/create_tab.dart';
import 'package:soul_meter/widgets/mobile/login/login_tab.dart';

class LoginPageViewWidget extends StatelessWidget {
  final PageController pageViewController;
  LoginPageViewWidget(this.pageViewController);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.amber,
            border: Border.all(
              color: Colors.blue,
            )),
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width,
          child: PageView(
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
