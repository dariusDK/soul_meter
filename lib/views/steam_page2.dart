import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:soul_meter/constants/constants.dart';
import 'package:soul_meter/widgets/data_header/data_header.dart';

import 'package:soul_meter/widgets/datas_box/data_info_horizontal.dart';
import 'package:soul_meter/widgets/datas_box/data_info_vertical.dart';
import 'package:soul_meter/widgets/datas_box/spotify_data_box.dart';
import 'package:soul_meter/widgets/datas_box/steam_data_box.dart';
import 'package:soul_meter/widgets/datas_box/steam_data_box2.dart';

class SteamDataPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: hasAnySpotifyResult,
        builder: (BuildContext context, bool result, Widget widget) {
          return result
              ? Visibility(
                  visible: result,
                  child: Expanded(
                    child: Container(
                        //color: Colors.white, // Red
                        decoration: backgroundImage2,
                        height: MediaQuery.of(context).size.height,
                        //alignment: Alignment.center,
                        child: Row(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width / 3,
                              child: SteamDataInfoWidget("asdsadad"),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width / 3,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                        child: CircularPercentIndicator(
                                      header: Text("RATE"),
                                      radius: 100,
                                      percent: 0.8,
                                    )),
                                    Container(
                                        child: CircularPercentIndicator(
                                            radius: 80)),
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
                              child: SteamDataInfo2Widget("asdsadad"),
                            )
                          ],
                        )),
                  ),
                )
              : SizedBox.shrink();
        });
  }
}
