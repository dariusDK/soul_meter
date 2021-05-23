import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:soul_meter/constants/constants.dart';
import 'package:soul_meter/widgets/data_header/data_header.dart';

import 'package:soul_meter/widgets/datas_box/data_info_horizontal.dart';
import 'package:soul_meter/widgets/datas_box/data_info_vertical.dart';
import 'package:soul_meter/widgets/datas_box/default_data_box.dart';

class SpotifyDataPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: hasAnySpotifyResult,
        builder: (BuildContext context, bool result, Widget widget) {
          return Visibility(
            visible: true,
            child: Expanded(
              child: Container(
                  //color: Colors.white, // Red
                  decoration: backgroundImage3,
                  height: MediaQuery.of(context).size.height,
                  //alignment: Alignment.center,
                  child: Row(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width / 3,
                        child: DefaultDataInfoWidget(
                            spotifyUser1.me["name"],
                            " asdasd",
                            spotifyUser1.me["images"][0]["url"],
                            Colors.green),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width / 3,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                  child: CircularPercentIndicator(
                                header: Text("RATE"),
                                radius: 100,
                                percent: rateResult.value,
                              )),
                              Container(
                                  child: CircularPercentIndicator(radius: 80)),
                              Container(
                                  child: CircularPercentIndicator(
                                radius: 60,
                              ))
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width / 3,
                        child: DefaultDataInfoWidget(
                            spotifyUser2.me["name"],
                            " asdasd",
                            spotifyUser2.me["images"][0]["url"],
                            Colors.green),
                      )
                    ],
                  )),
            ),
          );
        });
  }
}
