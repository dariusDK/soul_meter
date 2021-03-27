import 'package:flutter/material.dart';

class LoginPageMobile extends StatelessWidget {
  var pageViewController =
      PageController(initialPage: 0, keepPage: true, viewportFraction: 1);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          /*Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: ElevatedButton(
                child: Text("tab1"),
                onPressed: () {},
              )),
              Expanded(
                  child: ElevatedButton(
                child: Text("tab2"),
                onPressed: () {},
              )),
            ],
          ),*/
          PageView(
            scrollDirection: Axis.horizontal,
            controller: pageViewController,
            children: const <Widget>[
              Center(
                child: Text('First Page'),
              ),
              Center(
                child: Text('Second Page'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
