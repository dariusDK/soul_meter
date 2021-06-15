//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:soul_meter/constants/constants.dart';
import 'package:soul_meter/functions/basic_functions.dart';
import 'package:soul_meter/widgets/dialogs/error_dialog.dart';

class SearchBarDesktop extends StatefulWidget {
  @override
  _SearchBarDesktopState createState() => _SearchBarDesktopState();
}

class _SearchBarDesktopState extends State<SearchBarDesktop> {
  bool _folded = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 400),
      width: _folded ? 56 : 550,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: Colors.grey[200],
        boxShadow: kElevationToShadow[6],
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 16),
              child: !_folded
                  ? TextField(
                      onSubmitted: (nickName) {
                        isLoading.value = true;
                        try {
                          if (auth.currentUser != null) {
                            FirebaseFirestore.instance
                                .collection("user-names")
                                .doc(nickName)
                                .get()
                                .then((value) => value.exists
                                    ? rateFuction(auth.currentUser.email, value["email"])
                                        .then((value) => scrollController.animateTo(
                                            scrollController.offset +
                                                MediaQuery.of(context)
                                                    .size
                                                    .height,
                                            curve: Curves.linear,
                                            duration:
                                                Duration(milliseconds: 500)))
                                    : showDialog(
                                            context: context,
                                            builder: (context) => ShowErrorDialog(
                                                "Cannot found that user"))
                                        .then((value) {
                                        isLoading.value = false;
                                      }));
                          } else {
                            showDialog(
                                context: context,
                                builder: (context) => ShowErrorDialog(
                                    "You must login or create account to use this"));
                          }
                        } catch (e) {
                          showDialog(
                                  context: context,
                                  builder: (context) =>
                                      ShowErrorDialog("Cannot found that user"))
                              .then((value) {
                            isLoading.value = false;
                          });
                        }
                      },
                      decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle: TextStyle(color: Colors.blue[300]),
                          border: InputBorder.none),
                    )
                  : null,
            ),
          ),
          Container(
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(_folded ? 32 : 0),
                  topRight: Radius.circular(32),
                  bottomLeft: Radius.circular(_folded ? 32 : 0),
                  bottomRight: Radius.circular(32),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(
                    _folded ? Icons.search : Icons.close,
                    color: Colors.blue[900],
                    size: 24,
                  ),
                ),
                onTap: () {
                  setState(() {
                    _folded = !_folded;
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
