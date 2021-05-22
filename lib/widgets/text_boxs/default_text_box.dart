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
      height: MediaQuery.of(context).size.height / 15,
      width: MediaQuery.of(context).size.width / 5,
      //color: Colors.red,
      padding: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 10),
      child: TextField(
        style: TextStyle(
            color: Colors.white,
            fontSize: MediaQuery.of(context).size.width *
                MediaQuery.of(context).size.height /
                80000),
        obscureText: this.isPassword,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Color(0xFFccb0be))),
            labelStyle: TextStyle(color: Colors.white),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            labelText: this.title,
            prefixIcon: Icon(
              this.icon,
              color: Color(0xFF67525c),
              size: MediaQuery.of(context).size.height / 35,
            ),
            //fillColor: Colors.grey[700],
            filled: true),
        controller: textEditingController,
      ),
    );
  }

  get getText {
    return textEditingController.text;
  }

  set text(String text) {
    textEditingController.text = text;
  }
}
