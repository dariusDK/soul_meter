import 'dart:convert';
import 'dart:io';
import 'dart:js';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:soul_meter/constants/constants.dart';
import 'package:soul_meter/constants/spotify_user.dart';
import 'package:soul_meter/functions/api_functions.dart';

Future<String> login(String email, String password) async {
  String result = "";
  if (email.contains("@") && email.contains(".")) {
    if (password.length > 5) {
      userEmail = email;
      try {
        await auth.signInWithEmailAndPassword(email: email, password: password);
      } on FirebaseAuthException catch (e) {
        result = e.message;
        print("kullanıcı girişi başarısız");
      }
    } else {
      result = "Invalid e-mail or password";
    }
  } else {
    result = "Invalid e-mail or password";
  }

  return result;
}

Future<String> createAccount(String nickName, String email, String password,
    String passwordAgain) async {
  String result = "";
  var emailValid = false;
  var passwordValid = false;
  var nicknameValid = false;
  if (email.contains("@") && email.contains(".")) {
    print("mail");
    emailValid = true;
  }
  if (password.length > 5 && password == passwordAgain) {
    print("pass");
    passwordValid = true;
  }
  if (nickName.length > 3) {
    userName = nickName;
    nicknameValid = true;
  }
  if (nicknameValid == true && passwordValid == true && emailValid == true) {
    await FirebaseFirestore.instance
        .collection('user-names')
        .doc(nickName)
        .get()
        .then((value) async {
      value.exists ? result += " username is in use" : null;
      await createUserFirebase(email, password).then((value) {
        value.isEmpty ? saveUserNameToDB(nickName, email) : result = value;
      });
    });
  }
  if (!nicknameValid) {
    result += "Nickname must be at least 4 character" + "\n";
  }
  if (!passwordValid) {
    result +=
        "Password must be at least 6 character and passwords should be matched" +
            "\n";
  }
  if (!emailValid) {
    result += "Invalid email" + "\n";
  }

  return result;
}

Future<String> createUserFirebase(String email, String password) async {
  String result = "";
  try {
    await auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => FirebaseFirestore.instance
                .collection("user")
                .doc(value.user.email)
                .set({"email": email, "user_name": userName}).whenComplete(() {
              createDefaultSteamUser(value.user);
              createDefaultSpotifyUser(value.user);
            }))
        .onError((error, stackTrace) => throw error);

    print("kullanıcı başarıyla oluşturuldu");

    return result;
  } catch (e) {
    print("kullanıcı oluşturulamadı");
    print(e.message);
    return e.message;
  }
}

Future<String> saveUserNameToDB(String nickName, String email) async {
  String result = "";
  try {
    FirebaseFirestore.instance
        .collection('user-names')
        .doc(nickName)
        .set({"email": email}).onError((error, stackTrace) => throw error);
  } catch (e) {
    result = e.toString();
  }
  return result;
}

Future<String> createDefaultSteamUser(User user) async {
  String result = "";
  try {
    await FirebaseFirestore.instance
        .collection("steam-data")
        .doc(user.email)
        .set({
      "basic_data": {"error": "not avalible"},
      "status": false
    }).onError((error, stackTrace) => throw error);
  } catch (e) {
    result = e.message;
  }
  return result;
}

Future<String> saveSteamUrlToDB(String url) async {
  String result = "";
  try {
    await FirebaseFirestore.instance
        .collection("steam-data")
        .doc(auth.currentUser.email)
        .update({"profile_link": url, "status": true}).onError(
            (error, stackTrace) => throw error);
  } catch (e) {
    result = e.message;
  }
  return result;
}

Future<String> createDefaultSpotifyUser(User user) async {
  String result = "";
  try {
    await FirebaseFirestore.instance
        .collection("spotify-data")
        .doc(user.email)
        .set({
      "user_access_token": {"error": "not avalible"},
      "spotify_basic_data": {"error": "not avalible"},
      "status": false
    }).onError((error, stackTrace) => throw error);
  } catch (e) {
    result = e.message;
  }
  return result;
}

Future<double> rateFuction(String user1, String user2) async {
  double result;
  isRatingStart.value = true;
  isRatingOver.value = false;
  print("user1 $user1 user2 $user2");
  await getFromServerMethod("/getrate", {"email1": user1, "email2": user2})
      .then((value) {
    rateResultAllData = value as Map;
    if (rateResultAllData.containsKey("spotify")) {
      rateSpotifyData = rateResultAllData["spotify"];
      hasAnySpotifyResult.value = true;
    } else {
      hasAnySpotifyResult.value = false;
    }
    if (rateResultAllData.containsKey("steam")) {
      rateSpotifyData = rateResultAllData["steam"];
      hasAnySteamResult.value = true;
    } else {
      hasAnySteamResult.value = false;
    }
    rateResult.value = value["result"] as double;
    result = rateResult.value;
    isRatingOver.value = true;
    isLoading.value = false;
  });
  return result;
}

void fillUsersSpotify(Map<String, dynamic> rateSpotifyData) {
  List<Track> top_tracks = [];
  List<dynamic> temp = rateSpotifyData["user1_top_tracks_sorted_by_popularity"];
  List<Artist> top_artists = [];
  (rateSpotifyData["user1_top_artists_sorted_by_popularity"]
          as List<Map<String, dynamic>>)
      .forEach((element) {
    top_artists.add(Artist.fromMap(element));
  });
  spotifyUser1 = SpotifyUser(
      me: Me.fromMap(rateSpotifyData["user1_me"]),
      top_artists: top_artists,
      top_tracks: top_tracks,
      top_genres: (rateSpotifyData["user1_genres_sorted_by_popularity"]
          as List<Map<String, dynamic>>));
  top_tracks = [];
  (rateSpotifyData["user2_top_tracks_sorted_by_popularity"]
          as List<Map<String, dynamic>>)
      .forEach((element) {
    top_tracks.add(Track.fromMap(element));
  });
  top_artists = [];
  (rateSpotifyData["user2_top_artists_sorted_by_popularity"]
          as List<Map<String, dynamic>>)
      .forEach((element) {
    top_artists.add(Artist.fromMap(element));
  });
  spotifyUser2 = SpotifyUser(
      me: Me.fromMap(rateSpotifyData["user2_me"]),
      top_artists: top_artists,
      top_tracks: top_tracks,
      top_genres: (rateSpotifyData["user2_genres_sorted_by_popularity"]
          as List<Map<String, dynamic>>));
}

void fillUsersSteam(Map<String, dynamic> fillUsersSteam) {}

Future<dynamic> getFromServerMethod(
    String path, Map<String, String> params) async {
  var result;

  await http.get(Uri.https(serverUrl, path, params), headers: {
    HttpHeaders.allowHeader: "*",
  }).then((value) => result = jsonDecode((value.body)));

  return result;
}

getUserStatus(String userEmail) async {
  await FirebaseFirestore.instance
      .collection("user-status")
      .doc(userEmail)
      .get()
      .then((value) {
    states.value = value.data() == null ? {} : value.data();
    if (states.value != null && states.value != {}) {
      isSpotifySelected.value = states.value.containsKey("sp_status")
          ? states.value["sp_status"]
          : false;
      isSteamSelected.value = states.value.containsKey("steam_status")
          ? states.value["steam_status"]
          : false;
    } else {
      print("states objesi boş döndü");
    }
  });
}

String getSpotifyBasicData(Map<String, dynamic> data) {
  String result;

  result = "Name: " + data['name'] + "\n";
  result += "Country: " + data['country'] + "\n";
  result += "Current Top Artist: " + data['current_top_artist'] + "\n";
  result += "Total Followers: " + data['num_followers'].toString() + "\n";
  result += "Product: " + data['product'] + "\n";

  return result;
}

bool isValidSteamURL(String url) {
  try {
    if (url.startsWith(RegExp(r'^https://steamcommunity.com'))) {
      steamURL = url;
      return true;
    } else {
      return false;
    }
  } catch (e) {
    print(e.toString());
    return false;
  }
}
