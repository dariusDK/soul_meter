import 'package:flutter/material.dart';

class DataInfoHorizontalWidget extends StatelessWidget {
  String title;
  String image;
  String titleHeader;
  Color appColor;
  DataInfoHorizontalWidget(
      String titleHeader, String title, String image, Color appColor) {
    this.titleHeader = titleHeader;
    this.title = title;
    this.image = image;
    this.appColor = appColor;
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
        ClipPath(
          clipper: ShapeBorderClipper(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40))),
          child: Container(
            height: MediaQuery.of(context).size.height / 4,
            width: MediaQuery.of(context).size.width / 5,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: appColor,
                  width: 2,
                ),
                right: BorderSide(
                  color: appColor,
                  width: 2,
                ),
                bottom: BorderSide(
                  color: appColor,
                  width: 2,
                ),
              ),
            ),
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
        ),
        Positioned(
            top: MediaQuery.of(context).size.height / 15,
            left: -MediaQuery.of(context).size.height / 20,
            child: CircleAvatar(
                backgroundColor: Colors.redAccent,
                radius: MediaQuery.of(context).size.height / 17,
                child: Image.network(
                  image,
                  fit: BoxFit.fill,
                ))),
      ],
    ));
  }
}
