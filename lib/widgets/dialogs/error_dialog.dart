import 'package:flutter/material.dart';

class ShowErrorDialog extends StatelessWidget {
  final String value;
  ShowErrorDialog(this.value);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Alert',
        style: TextStyle(color: Colors.red),
      ),
      content: Text(value),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          },
          child: Text('OK'),
        ),
      ],
    );
  }
}
