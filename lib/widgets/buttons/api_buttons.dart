import 'package:flutter/material.dart';
import 'package:soul_meter/constants/constants.dart';
import 'package:soul_meter/constants/state_container.dart';

class ApiButtonWidget extends StatefulWidget {
  final String text;

  const ApiButtonWidget(
    this.text,
  );

  @override
  _ApiButtonWidgetState createState() => _ApiButtonWidgetState();
}

class _ApiButtonWidgetState extends State<ApiButtonWidget> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            child: Text(widget.text),
            style: apiButtonDecoration,
            onPressed: () {
              setState(() {
                checked = true;
              });
            },
          ),
          Checkbox(
              value: checked,
              checkColor: Colors.white,
              activeColor: Colors.lightBlueAccent,
              onChanged: (bool value) {})
        ],
      ),
    );
  }
}
