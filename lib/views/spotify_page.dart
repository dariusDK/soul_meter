import 'package:flutter/material.dart';
import 'package:soul_meter/constants/constants.dart';
import 'package:soul_meter/widgets/data_header/data_header.dart';

import 'package:soul_meter/widgets/datas_box/data_info_horizontal.dart';
import 'package:soul_meter/widgets/datas_box/data_info_vertical.dart';

class SpotifyDataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: hasAnySpotifyResult,
        builder: (BuildContext context, bool result, Widget widget) {
          return Visibility(
              visible: result,
              child: Expanded(
                child: Container(
                  //color: Colors.white, // Red
                  decoration: backgroundImage3,
                  height: MediaQuery.of(context).size.height,
                  //alignment: Alignment.center,
                  child: Column(
                    children: [
                      DataHeaderWidget("Spotify ekranı"),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 60, right: 20),
                            //color: Colors.red,
                            height: MediaQuery.of(context).size.height * 0.70,
                            width: MediaQuery.of(context).size.width / 2,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    //track
                                    DataInfoHorizontalWidget(
                                        spotifyUser1
                                                .topTracksSortedByPopularity[0]
                                            ["name"],
                                        spotifyUser1
                                                .topTracksSortedByPopularity[0]
                                            ["album"]["artists"][0]["name"],
                                        spotifyUser1
                                                .topTracksSortedByPopularity[0]
                                            ["album"]["images"][0]["url"],
                                        Colors.green),
                                    //profil
                                    DataInfoVerticalWidget(
                                      spotifyUser1.me["display_name"],
                                      " ",
                                      spotifyUser1.me["images"][0]["url"],
                                      Colors.green,
                                    ),
                                  ],
                                ),
                                //artist
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    DataInfoHorizontalWidget(
                                        spotifyUser1
                                                .topArtistsSortedByPopularity[0]
                                            ["name"],
                                        spotifyUser1
                                                .topArtistsSortedByPopularity[0]
                                            ["genres"][0],
                                        spotifyUser1
                                                .topArtistsSortedByPopularity[0]
                                            ["images"][0]["url"],
                                        Colors.green),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            //user 2,
                            padding: EdgeInsets.only(right: 20),
                            height: MediaQuery.of(context).size.height * 0.70,
                            width: MediaQuery.of(context).size.width / 2,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    DataInfoHorizontalWidget(
                                        spotifyUser2
                                                .topTracksSortedByPopularity[0]
                                            ["name"],
                                        spotifyUser2
                                                .topTracksSortedByPopularity[0]
                                            ["album"]["artists"][0]["name"],
                                        spotifyUser2
                                                .topTracksSortedByPopularity[0]
                                            ["album"]["images"][0]["url"],
                                        Colors.green),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    DataInfoVerticalWidget(
                                        spotifyUser2.me["display_name"],
                                        " ",
                                        spotifyUser2.me["images"][0]["url"],
                                        Colors.green),
                                    DataInfoHorizontalWidget(
                                        spotifyUser2
                                                .topArtistsSortedByPopularity[0]
                                            ["name"],
                                        spotifyUser2
                                                .topArtistsSortedByPopularity[0]
                                            ["genres"][0],
                                        spotifyUser2
                                                .topArtistsSortedByPopularity[0]
                                            ["images"][0]["url"],
                                        Colors.green)
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ));
        });
  }
}
