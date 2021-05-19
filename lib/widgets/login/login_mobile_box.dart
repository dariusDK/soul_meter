import 'package:flutter/material.dart';
import 'package:soul_meter/constants/constants.dart';

import 'login_page_view_widget.dart';

class LoginMobileBoxWidget extends StatefulWidget {
  @override
  _LoginMobileBoxWidgetState createState() => _LoginMobileBoxWidgetState();
}

class _LoginMobileBoxWidgetState extends State<LoginMobileBoxWidget> {
  var pageViewController =
      PageController(initialPage: 0, keepPage: true, viewportFraction: 1);
  List<bool> isSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width / 2,
      child: SizedBox(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Center(
                  child: ToggleButtons(
                    color: Colors.greenAccent,
                    selectedColor: Colors.blue,
                    isSelected: isSelected,
                    borderWidth: 1.5,
                    borderColor: Colors.green,
                    selectedBorderColor: Colors.blue,
                    renderBorder: false,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 76),
                        child: Text(loginButtonText,
                            style: TextStyle(
                                fontSize: MediaQuery.of(context).size.width *
                                    MediaQuery.of(context).size.height /
                                    70000)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 46),
                        child: Text(createButtonText,
                            style: TextStyle(
                                fontSize: MediaQuery.of(context).size.width *
                                    MediaQuery.of(context).size.height /
                                    70000)),
                      ),
                    ],
                    onPressed: (int newIndex) {
                      setState(() {
                        for (int index = 0;
                            index < isSelected.length;
                            index++) {
                          if (index == newIndex) {
                            isSelected[index] = true;
                            pageViewController.jumpToPage(1);
                          } else {
                            isSelected[index] = false;
                            pageViewController.jumpToPage(0);
                          }
                        }
                      });
                    },
                  ),
                )),
              ],
            ),
            LoginPageViewWidget(pageViewController)
          ],
        ),
      ),
    );
  }
}
