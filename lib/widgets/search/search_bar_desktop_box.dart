import 'package:flutter/material.dart';
import 'package:soul_meter/widgets/desktop/home/desktop_result_box.dart';
import 'package:soul_meter/widgets/search/search_bar_desktop.dart';

class SearchBarDesktopBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        //color: Colors.green,
        height: MediaQuery.of(context).size.height * 0.70,
        width: MediaQuery.of(context).size.width / 3,
        margin: EdgeInsets.only(left: 50, top: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  "Find Your SoulMate ",
                  style: TextStyle(
                    fontSize: 0.030 * MediaQuery.of(context).size.width,
                  ),
                ),
                SearchBarDesktop(),
              ],
            ),
            ResultDesktopBox(),
          ],
        ));
  }
}
