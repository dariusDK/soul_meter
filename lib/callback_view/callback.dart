import 'package:flutter/material.dart';
import 'package:soul_meter/constants/constants.dart';
import 'dart:js' as js;
import 'dart:html' as html;

class CallBackView extends StatelessWidget {
  CallBackView() {
    /*var uri = Uri.tryParse(js.context['location']['href']);
    spAuthCode = uri.queryParameters['code'];
    print(spAuthCode);
    var uri = Uri.parse(html.window.location.href);*/
  }
  @override
  Widget build(BuildContext context) {
    var uri = Uri.parse(html.window.location.href);
    print(uri.hasQuery);
    print(ModalRoute.of(context).settings.arguments);

    return Container(
      child: ElevatedButton(
        child: Text("sayfayı kapatabilirsiniz"),
        onPressed: () {},
      ),
    );
  }
}
