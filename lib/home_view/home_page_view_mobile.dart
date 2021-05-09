import 'package:flutter/material.dart';
import 'package:soul_meter/widgets/api_box/api_mobile_box.dart';
import 'package:soul_meter/widgets/custom_appbar/custom_mobile_side_bar.dart';

import 'package:soul_meter/widgets/search/search_bar_mobile_box.dart';

class HomePageMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Column(
        children: [
          ElevatedButton(
        child: Text("tıkla"),
        
         onPressed: () { 
    
         }),
          Container(
            
            child: Row(
              children: [
                
                
                SearchBarMobileBox(),
              ],
            ),
          ),
        ],
      ),

    );
  }
}
