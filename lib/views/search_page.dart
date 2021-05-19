import 'package:flutter/material.dart';

import 'package:soul_meter/constants/constants.dart';
import 'package:soul_meter/widgets/search/search_bar_desktop_box.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: backgroundImage2,
        height: MediaQuery.of(context).size.height * 1.05,
        child: Center(
          child: SearchBarDesktopBox(),
        ),
      ),
    );
  }
}
