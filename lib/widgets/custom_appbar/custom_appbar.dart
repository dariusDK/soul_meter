import 'package:flutter/material.dart';
import 'package:soul_meter/widgets/buttons/home_appbar_button.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: double.infinity,
        height: 100,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: Colors.blueGrey,
          ), //tema rengi
          child: Row(
            children: [
              Padding(
                  padding: EdgeInsetsDirectional.only(start: 240),
                  child: HomeAppbarButton())
            ],
          ),
        ),
      ),
    );
  }
}
