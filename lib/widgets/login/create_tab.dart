import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:soul_meter/constants/constants.dart';
import 'package:soul_meter/functions/basic_functions.dart';
import 'package:soul_meter/widgets/dialogs/error_dialog.dart';
import 'package:soul_meter/widgets/text_boxs/default_text_box.dart';

class CreateTab extends StatelessWidget {
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
          Column(
            children: [
              nickNameTextWidget,
              emailTextWidget,
              passwordTextWidget,
              passwordAgainTextWidget,
            ],
          ),
<<<<<<< HEAD
          ElevatedButton(
            onPressed: () {
              isSpotifySelected.value = true;
            },
            child: Text("Spotify"),
            style: spotifyButtonDecoration,
          ),
          steamUrlTextWidget,
=======
          RichText(
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
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 27,
                width: MediaQuery.of(context).size.width / 5.5,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Spotify"),
                  style: spotifyButtonDecoration,
                ),
              ),
              DefaultTextBoxWidget(
                  "Steam Profile URL", Icons.ac_unit_outlined, false),
            ],
          ),
>>>>>>> b44ea2dd685bc221efb8bf4dff9aecac61963d45
          Container(
              height: MediaQuery.of(context).size.height / 32,
              width: MediaQuery.of(context).size.width / 5.5,
              //margin: EdgeInsets.only(bottom: 65),
              child: RoundedLoadingButton(
<<<<<<< HEAD
            child: Text('Creat Account', style: TextStyle(color: Colors.white)),
            controller: _btnController,
            onPressed: () {
              isSteamSelected.value =
                  isValidSteamURL(steamUrlTextWidget.getText);
              createAccount(
                      nickNameTextWidget.getText,
                      emailTextWidget.getText,
                      passwordTextWidget.getText,
                      passwordAgainTextWidget.getText)
                  .then((value) async {
                if (value.isEmpty) {
                } else {
                  await showDialog(
                          context: context,
                          builder: (context) => ShowErrorDialog(value))
                      .then((value) => _btnController.stop());
                }
              });
            },
          )),
=======
                child: Text('Creat Account',
                    style: TextStyle(color: Colors.white)),
                controller: _btnController,
                onPressed: () {
                  createAccount(
                          nickNameTextWidget.getText,
                          emailTextWidget.getText,
                          passwordTextWidget.getText,
                          passwordAgainTextWidget.getText)
                      .then((value) async => value.isEmpty
                          ? Navigator.pushNamed(context, "/")
                          : await showDialog(
                                  context: context,
                                  builder: (context) => ShowErrorDialog(value))
                              .then((value) => _btnController.stop()));
                },
              )),
>>>>>>> b44ea2dd685bc221efb8bf4dff9aecac61963d45
        ],
      ),
    );
  }
}
