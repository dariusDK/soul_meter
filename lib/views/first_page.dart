import 'package:flutter/material.dart';
import 'package:soul_meter/constants/constants.dart';
import 'package:soul_meter/widgets/buttons/get_started.dart';
import 'package:soul_meter/widgets/login/login_mobile_box.dart';
import 'package:soul_meter/widgets/profile_settings.dart/profile_settings.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backgroundImage2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 50),
                          child: Column(
                            children: [
                              Text(
                                "SoulMeter",
                                style: TextStyle(
                                    color: Colors.grey[300],
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            MediaQuery.of(context).size.height /
                                            15000),
                              ),
                              Text(
                                "1 step away to find your soulmate",
                                style: TextStyle(
                                    color: Colors.grey[300],
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            MediaQuery.of(context).size.height /
                                            40000),
                              )
                            ],
                          )),
                      Container(
                        child: Center(child: GetStartedButton()),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width / 2,
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 3.5,
                bottom: MediaQuery.of(context).size.height / 15),
            child: Column(
              children: [
                Expanded(
                  child: ValueListenableBuilder<bool>(
                      valueListenable: isGetStartedSelected,
                      builder: (BuildContext context, bool isGetStarted,
                          Widget widget) {
                        bool loginCondition;

                        loginCondition =
                            auth == null || auth.currentUser == null;

                        if (isGetStarted) {
                          return loginCondition
                              ? LoginMobileBoxWidget()
                              : ProfileSettingsWidget();
                        }
                        return SizedBox.shrink();
                      }),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
