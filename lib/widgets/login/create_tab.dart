import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:soul_meter/constants/constants.dart';
import 'package:soul_meter/functions/api_functions.dart';
import 'package:soul_meter/functions/basic_functions.dart';
import 'package:soul_meter/widgets/dialogs/error_dialog.dart';
import 'package:soul_meter/widgets/text_boxs/default_text_box.dart';

class CreateTab extends StatefulWidget {
  @override
  _CreateTabState createState() => _CreateTabState();
}

class _CreateTabState extends State<CreateTab> {
  final emailTextWidget = DefaultTextBoxWidget("e-mail", Icons.mail, false);

  final passwordTextWidget = DefaultTextBoxWidget("password", Icons.lock, true);

  final nickNameTextWidget =
      DefaultTextBoxWidget("nick name", Icons.account_box, false);

  final passwordAgainTextWidget =
      DefaultTextBoxWidget("password again", Icons.lock, true);

  final steamUrlTextWidget =
      DefaultTextBoxWidget("Steam Profile URL", Icons.ac_unit_outlined, false);

  bool _isCreateAccount = false;

  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Visibility(
            visible: !isAccountCreated,
            child: Column(
              children: [
                nickNameTextWidget,
                emailTextWidget,
                passwordTextWidget,
                passwordAgainTextWidget,
              ],
            ),
          ),
          Visibility(
            visible: isAccountCreated,
            child: RichText(
                text: TextSpan(
                    text: "Before Get Started Connect ",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width *
                            MediaQuery.of(context).size.height /
                            90000,
                        color: Colors.grey),
                    children: [
                  TextSpan(
                      text: "At Least 1 App ",
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold)),
                  TextSpan(
                    text: "To Your Account ",
                  )
                ])),
          ),
          Visibility(
            visible: isAccountCreated,
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 27,
                  width: MediaQuery.of(context).size.width / 5.5,
                  child: ElevatedButton(
                    onPressed: () {
                      if (!isSpotifyConnected.value) {
                        isSpotifySelected.value = true;
                        getSpotifyAuthCode();
                      }
                    },
                    child: isAccountCreated
                        ? StreamBuilder<DocumentSnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection("spotify-data")
                                .doc(auth.currentUser.email)
                                .snapshots(includeMetadataChanges: true),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                isSpotifyConnected.value =
                                    snapshot.data.data()["status"];
                                canComplete.value = true;
                                return Text(isSpotifyConnected.value
                                    ? "Spotify connected!"
                                    : "Connect Spotify");
                              }
                              return SizedBox.shrink();
                            })
                        : ValueListenableBuilder<bool>(
                            valueListenable: isSpotifyConnected,
                            builder: (BuildContext context, bool result,
                                Widget widget) {
                              return Text("Connect Spotify");
                            }),
                    style: spotifyButtonDecoration,
                  ),
                ),
                steamUrlTextWidget,
              ],
            ),
          ),
          Visibility(
            visible: !isAccountCreated,
            child: Container(
                height: MediaQuery.of(context).size.height / 32,
                width: MediaQuery.of(context).size.width / 5.5,
                //margin: EdgeInsets.only(bottom: 65),
                child: RoundedLoadingButton(
                  child:
                      Text('Next Step', style: TextStyle(color: Colors.white)),
                  controller: _btnController,
                  onPressed: () {
                    createAccount(
                            nickNameTextWidget.getText,
                            emailTextWidget.getText,
                            passwordTextWidget.getText,
                            passwordAgainTextWidget.getText)
                        .then((value) async {
                      if (value.isEmpty) {
                        setState(() {
                          isAccountCreated = true;
                        });
                      } else {
                        await showDialog(
                                context: context,
                                builder: (context) => ShowErrorDialog(value))
                            .then((value) => _btnController.stop());
                      }
                    });
                  },
                )),
          ),
          Visibility(
            visible: isAccountCreated,
            child: Container(
                height: MediaQuery.of(context).size.height / 32,
                width: MediaQuery.of(context).size.width / 5.5,
                //margin: EdgeInsets.only(bottom: 65),
                child: RoundedLoadingButton(
                  child: Text('Creat Account',
                      style: TextStyle(color: Colors.white)),
                  controller: _btnController,
                  onPressed: () async {
                    _btnController.start();
                    _btnController.stop();
                    try {
                      isSteamSelected.value =
                          isValidSteamURL(steamUrlTextWidget.getText);
                      if (isSteamSelected.value || isSpotifySelected.value) {
                        if (isSteamSelected.value) {
                          saveSteamUrlToDB(steamURL).then((value) async {
                            if (value.isEmpty) {
                              canComplete.value = true;
                              isCreateComplete.value = true;
                              isGetStartedSelected.value = false;
                              scrollController.animateTo(
                                  scrollController.offset +
                                      MediaQuery.of(context).size.height,
                                  curve: Curves.linear,
                                  duration: Duration(milliseconds: 500));
                            } else {
                              await showDialog(
                                      context: context,
                                      builder: (context) => ShowErrorDialog(
                                          "please add at least one account to complete your profile"))
                                  .then((value) => _btnController.stop());
                            }
                          });
                        }
                        if (isSpotifySelected.value) {
                          if (isSpotifyConnected.value) {
                            isCreateComplete.value = true;
                            isGetStartedSelected.value = false;
                            scrollController.animateTo(
                                scrollController.offset +
                                    MediaQuery.of(context).size.height,
                                curve: Curves.linear,
                                duration: Duration(milliseconds: 500));
                          } else {
                            await showDialog(
                                    context: context,
                                    builder: (context) => ShowErrorDialog(
                                        "wait until spotify connection complete"))
                                .then((value) => _btnController.stop());
                          }
                        }
                      } else {
                        await showDialog(
                                context: context,
                                builder: (context) => ShowErrorDialog(
                                    "please add at least one account to complete your profile"))
                            .then((value) => _btnController.stop());
                      }
                    } catch (e) {
                      showDialog(
                              context: context,
                              builder: (context) =>
                                  ShowErrorDialog(e.toString()))
                          .then((value) => _btnController.stop());
                    }
                  },
                )),
          ),
        ],
      ),
    );
  }
}
