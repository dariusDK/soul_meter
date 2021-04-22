import 'package:flutter/material.dart';
import 'package:soul_meter/constants/constants.dart';


class MobileSideBar extends StatefulWidget {
  @override
  _MobileSideBarState createState() => _MobileSideBarState();     
}
class _MobileSideBarState extends State<MobileSideBar>{
  @override 
  Widget build(BuildContext context){
    return Container(
      color: Colors.brown,
      margin: EdgeInsets.only(right:4*(MediaQuery.of(context).size.width)/5 ),
      padding: EdgeInsets.only(right:100),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width/5,
      
      
    );
        
    
  }
}