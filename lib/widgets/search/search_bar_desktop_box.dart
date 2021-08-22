import 'package:flutter/material.dart';
import 'package:soul_meter/widgets/search/search_bar_desktop.dart';
import 'package:soul_meter/widgets/search/search_loading.dart';

class SearchBarDesktopBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        //color: Colors.green,
        //height: MediaQuery.of(context).size.height * 0.70,
        //width: MediaQuery.of(context).size.width / 3,
        //margin: EdgeInsets.only(left: 50, top: 100),
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Text(
              "Find Your SoulMate ",
              style: TextStyle(
                color: Colors.grey[300],
                fontSize: MediaQuery.of(context).size.width *
                    MediaQuery.of(context).size.height /
                    20000,
              ),
            ),
            SearchBarDesktop(),
          ],
        ),
        SearchLoadingWidget()
      ],
    ));
  }
}
