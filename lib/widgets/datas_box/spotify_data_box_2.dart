import 'package:flutter/material.dart';
import 'package:soul_meter/constants/constants.dart';
import 'package:soul_meter/widgets/text_boxs/data_text_box.dart';

class SpotifyDataInfo2Widget extends StatelessWidget {
  String image;

  SpotifyDataInfo2Widget(String image) {
    this.image = image;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
        //backgroundColor: Colors.blueGrey[900],
        child: Center(
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          ClipPath(
            clipper: ShapeBorderClipper(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40))),
            child: Container(
              height: MediaQuery.of(context).size.height / 1.5,
              width: MediaQuery.of(context).size.width / 4,
              decoration: BoxDecoration(
                //color: Colors.transparent,
                border: Border(
                  right: BorderSide(
                    color: Colors.green,
                    width: 2,
                  ),
                  left: BorderSide(
                    color: Colors.green,
                    width: 2,
                  ),
                  bottom: BorderSide(
                    color: Colors.green,
                    width: 2,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("En sevdiği Şarkılar",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.height / 40,
                            color: Colors.grey[500])),
                    DataInfoTextBox(
                      rateResultAllData['spotify']
                          ['user2_top_tracks_sorted_by_popularity'][0]['name'],
                      rateResultAllData['spotify']
                          ['user2_top_tracks_sorted_by_popularity'][1]['name'],
                      rateResultAllData['spotify']
                          ['user2_top_tracks_sorted_by_popularity'][2]['name'],
                      rateResultAllData['spotify']
                          ['user2_top_tracks_sorted_by_popularity'][3]['name'],
                      rateResultAllData['spotify']
                          ['user2_top_artists_sorted_by_popularity'][4]['name'],
                    ),
                    Text("En sevdiği Sanatçılar",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.height / 40,
                            color: Colors.grey[500])),
                    DataInfoTextBox(
                        rateResultAllData['spotify']
                                ['user2_top_artists_sorted_by_popularity'][0]
                            ['name'],
                        rateResultAllData['spotify']
                                ['user2_top_artists_sorted_by_popularity'][1]
                            ['name'],
                        rateResultAllData['spotify']
                                ['user2_top_artists_sorted_by_popularity'][3]
                            ['name'],
                        rateResultAllData['spotify']
                                ['user2_top_artists_sorted_by_popularity'][4]
                            ['name'],
                        rateResultAllData['spotify']
                                ['user2_top_artists_sorted_by_popularity'][5]
                            ['name']),
                    Text("En sevdiği Türler",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.height / 40,
                            color: Colors.grey[500])),
                    DataInfoTextBox(
                        rateResultAllData['spotify']
                            ['user2_genres_sorted_by_popularity'][0]['genre'],
                        rateResultAllData['spotify']
                            ['user2_genres_sorted_by_popularity'][1]['genre'],
                        rateResultAllData['spotify']
                            ['user2_genres_sorted_by_popularity'][2]['genre'],
                        rateResultAllData['spotify']
                            ['user2_genres_sorted_by_popularity'][3]['genre'],
                        rateResultAllData['spotify']
                            ['user2_genres_sorted_by_popularity'][4]['genre']),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              top: -MediaQuery.of(context).size.height / 15,
              child: CircleAvatar(
                  backgroundColor: Colors.redAccent,
                  radius: MediaQuery.of(context).size.height / 17,
                  child: Image.network(
                    image,
                    fit: BoxFit.fill,
                  ))),
        ],
      ),
    ));
  }
}
