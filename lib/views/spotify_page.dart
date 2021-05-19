import 'package:flutter/material.dart';
import 'package:soul_meter/constants/constants.dart';
import 'package:soul_meter/widgets/data_header/data_header.dart';

import 'package:soul_meter/widgets/datas_box/data_info_horizontal.dart';
import 'package:soul_meter/widgets/datas_box/data_info_vertical.dart';

class SpotifyDataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: isSpoti,
        builder: (BuildContext context, bool isSpotify, Widget widget) {
          return Visibility(
              visible: true,
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
                                    DataInfoHorizontalWidget(
                                        "selam",
                                        "merhabaaaa",
                                        "https://i.scdn.co/image/ed3ad692458c1c47745d4a0023475c6a71a24af1"),
                                    DataInfoVerticalWidget("alo", "merhabaaaa",
                                        "https://i.scdn.co/image/ed3ad692458c1c47745d4a0023475c6a71a24af1"),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    DataInfoHorizontalWidget(
                                        "selam",
                                        "merhabaaaa",
                                        "https://i.scdn.co/image/ed3ad692458c1c47745d4a0023475c6a71a24af1"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            //color: Colors.yellow,
                            padding: EdgeInsets.only(right: 20),
                            height: MediaQuery.of(context).size.height * 0.70,
                            width: MediaQuery.of(context).size.width / 2,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    DataInfoHorizontalWidget(
                                        "alo",
                                        "merhabaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                                        "https://i.scdn.co/image/ed3ad692458c1c47745d4a0023475c6a71a24af1"),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    DataInfoVerticalWidget(
                                        "alo",
                                        "merhabaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                                        "https://i.scdn.co/image/ed3ad692458c1c47745d4a0023475c6a71a24af1"),
                                    DataInfoHorizontalWidget(
                                        "alo",
                                        "merhabaaaa",
                                        "https://i.scdn.co/image/ed3ad692458c1c47745d4a0023475c6a71a24af1")
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
