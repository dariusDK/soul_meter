/// Flutter code sample for SingleChildScrollView

// In this example, the column becomes either as big as viewport, or as big as
// the contents, whichever is biggest.

import 'package:flutter/material.dart';
import 'package:soul_meter/constants/constants.dart';
import 'package:soul_meter/views/first_page.dart';
import 'package:soul_meter/views/search_page.dart';
import 'package:soul_meter/views/spotify_page.dart';
import 'package:soul_meter/views/steam_page.dart';

void main() => runApp(const MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatelessWidget(),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      //style: Theme.of(context).textTheme.bodyText2,
      child: SingleChildScrollView(
        controller: scrollController,
        child: IntrinsicHeight(
          child: Column(children: <Widget>[
            MainPage(),
            SearchPage(),
            SpotifyDataPage(),
            SteamDataPage(),
          ]),
        ),
      ),
    );
  }
}
