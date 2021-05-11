import 'package:flutter/material.dart';
import 'package:soul_meter/constants/constants.dart';
import 'package:soul_meter/widgets/buttons/spotify_api_button.dart';
import 'package:soul_meter/widgets/buttons/drawer_spoti_button.dart';
import 'package:soul_meter/widgets/buttons/spotify_home_appbar_button.dart';
import 'package:soul_meter/widgets/search/search_bar_mobile_box.dart';
import 'package:soul_meter/widgets/loading_box/loading_box.dart';

class MobileAppbar extends StatefulWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  _MobileAppbarState createState() => _MobileAppbarState();
}

class _MobileAppbarState extends State<MobileAppbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Soul Meter",
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
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
        ),
      ),
      drawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.greenAccent[
              50], //This will change the drawer background to blue.
          //other styles
        ),
        child: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/Logomuz.png"),
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  child: Align(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        //Image.asset("images/Logomuz.png",scale: 1,),
                      ],
                    ),
                  )),
              LoadingBox(),
              SpotifyApiButtonWidget("Spotify"),
              Divider(
                color: Colors.white,
                height: 20,
              ),
              DrawerspotiButton("spotify-data"),
              Divider(
                color: Colors.white,
                height: 50,
              ),
              ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Colors.black,
                ),
                title: Text('Log-out'),
                tileColor: Colors.white30,
                onTap: () {
                  auth.signOut();
                  Navigator.pushNamed(context, "/login");
                },
              ),
            ],
          ),
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
