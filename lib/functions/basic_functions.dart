import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:soul_meter/constants/constants.dart';

void login(String email, String password) {
  if (email.contains("@") && email.contains(".")) {
    //pop up benzeri gelelbilir hataları yazmak için
    if (password.length > 5) {
      userEmail = email;
      getUserStatus(email);


      if (fireBaseAuth(email, password)) {}
    }
  }
}

bool fireBaseAuth(String email, String password) {
  //firesbae e buran girişi yap
}

void createAccount(
    String nickName, String email, String password, String passwordAgain) {
  if (email.contains("@") && email.contains(".")) {
    print("mail");
    //pop up benzeri gelelbilir hataları yazmak için
    if (password.length > 5 && password == passwordAgain) {
      print("pass");
      if (nickName.length > 3) {
        if (createUserFirebase(email, password)) {}
      }
    }
  }
}

bool createUserFirebase(String email, String password) {}

double rateFuction(String user1, String user2) {
  //server a karşılaştıralacak verileri gönderip al
  //kaan- server get
}

Future<String> getSpotifyData(String id) async {
  var result = await http.get(
      Uri.http("localhost:8080", "/deneme")); // kaan server da aç ve bağlan
  return result.body;
}

Future<dynamic> getUserStatus(String userEmail) async {
  return getFromServerMethod("/checkuser" + "?email=$userEmail");
}

Future<dynamic> getFromServerMethod(String path) async {
  var result;
  if (isLocal) {
    await http
        .get(Uri.http(
          serverUrl,
          path,
        ))
        .then((value) => result = jsonDecode((value.body)));
  } else {
    await http
        .get(Uri.https(
          serverUrl,
          path,
        ))
        .then((value) => result = jsonDecode((value.body)));
  }
  return result;
}
