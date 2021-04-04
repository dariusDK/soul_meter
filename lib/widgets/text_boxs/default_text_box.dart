import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DefaultTextBoxWidget extends StatelessWidget {
  final String title;
  final bool isPassword;
  final IconData icon;
  final textEditingController = TextEditingController();
  DefaultTextBoxWidget(this.title, this.icon, this.isPassword);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 50, right: 50, top: 5, bottom: 10),
      child: TextField(
        obscureText: this.isPassword,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            labelText: this.title,
            prefixIcon: Icon(this.icon),
            fillColor: Colors.grey[100],
            filled: true),
        controller: textEditingController,
      ),
    );
  }

  get getText {
    return textEditingController.text;
  }
}
