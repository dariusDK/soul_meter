import 'package:flutter/material.dart';
import 'package:soul_meter/constants/constants.dart';
import 'package:soul_meter/widgets/desktop/login/login_box.dart';
import 'package:soul_meter/widgets/mobile/login/login_page_view_widget.dart';

class LoginMobileBoxWidget extends StatefulWidget {
  @override
  _LoginMobileBoxWidgetState createState() => _LoginMobileBoxWidgetState();
}

class _LoginMobileBoxWidgetState extends State<LoginMobileBoxWidget> {
  var pageViewController =
      PageController(initialPage: 0, keepPage: true, viewportFraction: 1);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: ElevatedButton(
                child: Text(loginButtonText),
                onPressed: () {
                  pageViewController.jumpToPage(0);
                },
                style: mobileLoginTabButtonStyle,
              )),
              Expanded(
                  child: ElevatedButton(
                style: mobileLoginTabButtonStyle,
                child: Text(createButtonText),
                onPressed: () {
                  pageViewController.jumpToPage(1);

                  print("object");
                },
              )),
            ],
          ),
          LoginPageViewWidget(pageViewController)
        ],
      ),
    );
  }
}
