import 'package:flutter/material.dart';
import 'package:soul_meter/constants/constants.dart';
import 'package:soul_meter/functions/api_functions.dart';
import 'package:soul_meter/widgets/api_box/api_desktop_box.dart';
import 'package:soul_meter/widgets/buttons/api_buttons.dart';
import 'package:soul_meter/widgets/buttons/api_buttons.dart';

class DrawerMobile extends StatefulWidget {
  @override
  _DrawerMobileState createState() => _DrawerMobileState();
}

class _DrawerMobileState extends State<DrawerMobile> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
              child: Align(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Çakal Necmi Limited Company"),
              ],
            ),
          )),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Log-in Ekranına Dönüş'),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.pushNamed(context, "/");
            },
          ),
          ExpansionTile(
            leading: Icon(Icons.perm_device_information),
            title: Text('Spotify'),
            trailing: Icon(Icons.arrow_drop_down),
            children: <Widget>[
              ApiButtonWidget("Spotify"),
              ApiButtonWidget("Netflix"),
              ApiButtonWidget("Steam"),
            ],
          ),
          Divider(
            height: 30,
          ),
          ExpansionTile(
            leading: Icon(Icons.perm_device_information),
            title: Text('Spotify'),
            trailing: Icon(Icons.arrow_drop_down),
            children: <Widget>[Text("Spotify Datas")],
          ),
          Visibility(
            visible: isSpotifySelected.value, // parametreye bağla
            child: ExpansionTile(
              leading: Icon(Icons.perm_device_information),
              title: Text('Spotify'),
              trailing: Icon(Icons.arrow_drop_down),
              children: <Widget>[
                ApiButtonWidget("Spotify"),
                ApiButtonWidget("Netflix"),
                ApiButtonWidget("Steam"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  bool isAuthCompleted(String title) {
    if (title == "Spotify") {
      isSpotifySelected.value = true;
      return true;
    }
    if (title == "Netflix") {}
    if (title == "Steam") {}
  }
}
