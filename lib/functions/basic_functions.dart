import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:soul_meter/constants/constants.dart';
import 'package:soul_meter/functions/api_functions.dart';

Future<String> login(String email, String password) async {
  String result = "";
  if (email.contains("@") && email.contains(".")) {
    //pop up benzeri gelelbilir hataları yazmak için
    if (password.length > 5) {
      userEmail = email;
      try {
        await auth.signInWithEmailAndPassword(email: email, password: password);
      } on FirebaseAuthException catch (e) {
        result = e.message;
        print(result);
        if (result ==
            "There is no user record corresponding to this identifier. The user may have been deleted.") {
          result = "A user registered to the mail address could not be found.";
        }
        if (result == "Invalid e-mail or password") {
          result = "Invalid e-mail or password";
        }
        print("kullanıcı girişi başarısız");
      }
      //getUserStatus(email); bu fonksiyon urle düzeltildikten sonr aaçılacak
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
    await createUserFirebase(email, password).then((value) {
      value.isEmpty
          ? print("kayıt işlemi başarıyla tamamlandı")
          : result = value;
      FirebaseFirestore.instance
          .collection('user-names')
          .doc(nickName)
          .set({'email': email});
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
    if (isSpotifySelected.value || isSteamSelected.value) {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => FirebaseFirestore.instance
                  .collection("user")
                  .doc(value.user.email)
                  .set({"email": email, "user_name": userName}).whenComplete(
                      () {
                if (isSteamSelected.value) {
                  saveSteamUrlToDB(steamURL).then((value) => result = value);
                } else {
                  createDefaultSteamUser(value.user)
                      .then((value) => result = value);
                }
                if (isSpotifySelected.value) {
                  getSpotifyAuthCode();
                } else {
                  createDefaultSpotifyUser(value.user);
                }
              }))
          .onError((error, stackTrace) => throw error);
    } else {
      result =
          "you must add at least one account to your profile,Spotify would be great.";
    }
    print("kullanıcı başarıyla oluşturuldu");

    return result;
  } catch (e) {
    print("kullanıcı oluşturulamadı");
    print(e.message);
    return e.message;
  }
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
  //server a karşılaştıralacak verileri gönderip al
  //kaan- server get
  // getfrom server metonudan sadece sayfasının adı ve parapetreleri gönder
  // örnek olarak getFromServerMethod("getrate?email1=${user1}?email2=$user2")
  double result;
  isRatingStart.value = true;
  isRatingOver.value = false;
  print("user1 $user1 user2 $user2");
  await getFromServerMethod("/getrate", {"email1": user1, "email2": user2})
      .then((value) {
    rateResult.value = value["result"] as double;
    result = rateResult.value;
    isRatingOver.value = true;
  });
  return result;
}

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
  bool result = false;
  try {
    if (url.startsWith(RegExp(r'^https://steamcommunity.com'))) {
      result = true;
      steamURL = url;
    }
  } catch (e) {
    print(e.toString());
    return false;
  }
}
