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
        valueListenable: hasAnySteamResult,
        builder: (BuildContext context, bool result, Widget widget) {
          return result
              ? Visibility(
                  visible: result,
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
                              child: SteamDataInfoWidget("asdsadad"),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width / 3,
                              child: Center(
                                child: ValueListenableBuilder(
                                    valueListenable: isLoading,
                                    builder: (BuildContext context, bool result,
                                        Widget widget) {
                                      return Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                              child: CircularPercentIndicator(
                                            header: Text(
                                              "Total Rate",
                                              style: TextStyle(
                                                  color: Colors.grey[300],
                                                  fontSize: 24),
                                            ),
                                            center: Text(
                                                (((rateResultAllData['steam']
                                                            ['result']) *
                                                        100) as double)
                                                    .toStringAsFixed(1)),
                                            radius: 140,
                                            progressColor: Colors.blue,
                                            lineWidth: 9.0,
                                            percent: rateResultAllData['steam']
                                                ["result"],
                                          )),
                                          Container(
                                              child: CircularPercentIndicator(
                                            header: Text(
                                              "Top Games Rate",
                                              style: TextStyle(
                                                  color: Colors.grey[300],
                                                  fontSize: 24),
                                            ),
                                            center: Text(((((rateResultAllData[
                                                                'steam'][
                                                            'matched_top_games_score'] /
                                                        0.2)) *
                                                    100) as double)
                                                .toStringAsFixed(1)),
                                            radius: 120,
                                            lineWidth: 8.0,
                                            progressColor: Colors.blue,
                                            percent: rateResultAllData['steam'][
                                                    "matched_top_games_score"] /
                                                0.2,
                                          )),
                                          Container(
                                              child: CircularPercentIndicator(
                                            header: Text(
                                              "Top Genres Rate",
                                              style: TextStyle(
                                                  color: Colors.grey[300],
                                                  fontSize: 24),
                                            ),
                                            center: Text(((((rateResultAllData[
                                                                'steam'][
                                                            'matched_top_genres_score'] /
                                                        0.2)) *
                                                    100) as double)
                                                .toStringAsFixed(1)),
                                            radius: 100,
                                            progressColor: Colors.blue,
                                            lineWidth: 6.0,
                                            percent: rateResultAllData['steam'][
                                                    "matched_top_genres_score"] /
                                                0.2,
                                          ))
                                        ],
                                      );
                                    }),
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
