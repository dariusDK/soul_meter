import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:soul_meter/constants/constants.dart';
import 'package:soul_meter/widgets/data_header/data_header.dart';

import 'package:soul_meter/widgets/datas_box/data_info_horizontal.dart';
import 'package:soul_meter/widgets/datas_box/data_info_vertical.dart';
import 'package:soul_meter/widgets/datas_box/spotify_data_box.dart';
import 'package:soul_meter/widgets/datas_box/spotify_data_box_2.dart';

class SpotifyDataPage2 extends StatelessWidget {
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
                        decoration: backgroundImage3,
                        height: MediaQuery.of(context).size.height,
                        //alignment: Alignment.center,
                        child: Row(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width / 3,
                              child: SpotifyDataInfoWidget(),
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
                                            lineWidth: 9.0,
                                            header: Text(
                                              "Total Rate",
                                              style: TextStyle(
                                                  color: Colors.grey[300],
                                                  fontSize: 24),
                                            ),
                                            center: Text(
                                                (((rateResultAllData['spotify']
                                                            ['result']) *
                                                        100) as double)
                                                    .toStringAsFixed(1)),
                                            radius: 140,
                                            progressColor: Colors.green,
                                            percent:
                                                rateResultAllData['spotify']
                                                    ["result"],
                                          )),
                                          Container(
                                              child: CircularPercentIndicator(
                                                  header: Text('Top Artists Rate',
                                                      style: TextStyle(
                                                          color:
                                                              Colors.grey[300],
                                                          fontSize: 20)),
                                                  center: Text(
                                                      (((rateResultAllData['spotify'][
                                                                      'result_of_matched_top_artists'] /
                                                                  0.4) *
                                                              100) as double)
                                                          .toStringAsFixed(1)),
                                                  radius: 120,
                                                  lineWidth: 8.0,
                                                  progressColor: Colors.green,
                                                  percent: (rateResultAllData[
                                                              'spotify']
                                                          ['result_of_matched_top_artists']) /
                                                      0.4)),
                                          Container(
                                              child: CircularPercentIndicator(
                                            header: Text('Top Genres Rate',
                                                style: TextStyle(
                                                    color: Colors.grey[300],
                                                    fontSize: 16)),
                                            center: Text(((((rateResultAllData[
                                                                'spotify'][
                                                            'result_of_matched_top_artists_genres'] /
                                                        0.2)) *
                                                    100) as double)
                                                .toStringAsFixed(1)),
                                            lineWidth: 6.0,
                                            progressColor: Colors.green,
                                            percent: (rateResultAllData[
                                                        'spotify'][
                                                    'result_of_matched_top_artists_genres']) /
                                                0.2,
                                            radius: 100,
                                          ))
                                        ],
                                      );
                                    }),
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width / 3,
                              child: SpotifyDataInfo2Widget(),
                            )
                          ],
                        )),
                  ),
                )
              : SizedBox.shrink();
        });
  }
}
