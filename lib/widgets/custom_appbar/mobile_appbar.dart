import 'package:flutter/material.dart';
import 'package:soul_meter/constants/constants.dart';
import 'package:soul_meter/widgets/buttons/api_buttons.dart';
import 'package:soul_meter/widgets/search/search_bar_mobile_box.dart';

class MobileAppbar extends StatefulWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  _MobileAppbarState createState() => _MobileAppbarState();
}


  

  class _MobileAppbarState extends State<MobileAppbar> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("hi")),
      body: Center(child:  Container(
      color: Colors.red,
      child: Column(
        children: [
         
          Container(
            
            child: Row(
              children: [
                
                
                SearchBarMobileBox(),
              ],
            ),
          ),
        ],
      ),

    ),),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
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