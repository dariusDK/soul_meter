import 'package:flutter/material.dart';
import 'package:soul_meter/constants/constants.dart';
import 'package:soul_meter/widgets/buttons/home_appbar_button.dart';

class CustomDesktopAppBar extends StatefulWidget {
  @override
  _CustomDesktopAppBarState createState() => _CustomDesktopAppBarState();
}

var x = 0;

class _CustomDesktopAppBarState extends State<CustomDesktopAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height / 10,
        margin: EdgeInsets.only(top: 10, right: 10, left: 10),
        padding: EdgeInsets.only(left: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            //color: Colors.grey.shade100, //tema rengi
            boxShadow: kElevationToShadow[24],
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.purple, Colors.blue])),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.end,
          children: [
            PopupMenuButton(
              tooltip: "Log Out",
              icon: Icon(Icons.clear_rounded),
              offset: Offset(0, 58),
              itemBuilder: (BuildContext bc) => [
                PopupMenuItem(
                  child: Row(
                    children: [
                      Icon(Icons.logout),
                      Text("Log out"),
                      

                    ],
                onSelected: (route) {
                  print("object");
                  ////tıklanınca logut yapsın kenks menks ve de cenks
                  auth.signOut().then((value) {
                    Navigator.pushNamed(context, "/login");
                    print("içerdeyim");
                  });
                }),
            HomeAppbarButton("spotify-data"),
            TextButton(
                onPressed: () {
                  auth.signOut().then((value) {
                    Navigator.pushNamed(context, "/login");
                  });
                },
                child: Text("Log Out"))
          ],
        ));
  }
}
