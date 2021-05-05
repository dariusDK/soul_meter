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
      appBar: AppBar(title:  Text("Soul Meter",),centerTitle: true,),
      body: Center(child:  Container(
     
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
         
          ExpansionTile(
            
            leading: Image.asset("assets/images/ozan.ico"),
            title: Text('Spotify',style: TextStyle(fontSize: 16),),
            trailing: Icon(Icons.arrow_drop_down),
            children: <Widget>[
              ApiButtonWidget("Spotify"),
              Divider(
            height: 30,
            color:Colors.white30,
          ),
              ApiButtonWidget("Netflix"),
              Divider(
                color:Colors.white30,
            height: 30,
          ),
              ApiButtonWidget("Steam"),
            ],
          ),
          Divider(
            color:Colors.white30,
            height: 30,
          ),
          
          Visibility(
            visible: true, //isSpotifySelected.value, // parametreye bağla
            child: ExpansionTile(
              leading: Icon(Icons.description,color: Colors.green,size: 48,),
              title: Text('Spotify Datas',style: TextStyle(fontSize: 16),),
              trailing: Icon(Icons.arrow_drop_down),
              children: <Widget>[
              Text("Datas"),
              ],
            ),
          ),

           
         Divider(
            color:Colors.white30,
            height: 50,
          ),
           ListTile(
            leading: Icon(Icons.logout,color: Colors.black,),
            title: Text('Log-in Ekranına Dönüş'),
            onTap: () {
              Navigator.pushNamed(context, "/login");
            },
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