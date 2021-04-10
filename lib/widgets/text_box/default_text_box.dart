import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soul_meter/constants/constants.dart';

class DefaultTextBoxWidget extends StatelessWidget {
  final String title;
  final bool isPassword;
  final IconData icon;
  final textEditingController = TextEditingController();
  DefaultTextBoxWidget(this.title, this.icon, this.isPassword);
final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
              child: TextFormField(
          style: TextStyle(color: Colors.white),
          obscureText: this.isPassword,
          decoration: 
              InputDecoration(labelText: this.title, icon: Icon(this.icon),
              ),
                validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Invalid input';
                }
                return null;
              },
              
                
          controller: textEditingController,
        ),
      ),
    );
  }

  get getText {
    return textEditingController.text;
  }
  GlobalKey<FormState> get formKey{
    return _formKey;
  }
}
