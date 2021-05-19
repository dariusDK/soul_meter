import 'package:flutter/material.dart';

class DataInfoHorizontalWidget extends StatelessWidget {
  String title;
  String image;
  String titleHeader;
  DataInfoHorizontalWidget(String titleHeader, String title, String image) {
    this.titleHeader = titleHeader;
    this.title = title;
    this.image = image;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
        //backgroundColor: Colors.blueGrey[900],
        child: Stack(
      clipBehavior: Clip.none,
      //alignment: Alignment.topCenter,
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 4,
          width: MediaQuery.of(context).size.width / 5,
          decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Padding(
            padding: const EdgeInsets.only(left: 70),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  titleHeader,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.height / 30,
                      color: Colors.grey[500]),
                ),
                Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.height / 40,
                      color: Colors.grey[500]),
                )
              ],
            ),
          ),
        ),
        Positioned(
            top: MediaQuery.of(context).size.height / 15,
            left: -MediaQuery.of(context).size.height / 20,
            child: CircleAvatar(
                backgroundColor: Colors.redAccent,
                radius: MediaQuery.of(context).size.height / 17,
                child:
                    /*Image.asset(
                  "assets/images/Spotify_icon.png",
                  fit: BoxFit.fill,
                )*/
                    Image.network(
                  image,
                  fit: BoxFit.fill,
                ))),
      ],
    ));
  }
}
