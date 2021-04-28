import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:soul_meter/constants/constants.dart';

Future<bool> login(String email, String password) async {
  bool result = false;
  if (email.contains("@") && email.contains(".")) {
    //pop up benzeri gelelbilir hataları yazmak için
    if (password.length > 5) {
      userEmail = email;
      try {
        currentUser = auth
            .signInWithEmailAndPassword(email: email, password: password)
            .onError((error, stackTrace) => null);
        print("kullanıcı girişi başarılı");
        result = true;
      } on FirebaseAuthException {
        print("kullanıcı girişi başarısız");
      }
      //getUserStatus(email); bu fonksiyon urle düzeltildikten sonr aaçılacak
    }
  }
  return result;
}

Future<bool> createAccount(String nickName, String email, String password,
    String passwordAgain) async {
  bool result = false;
  if (email.contains("@") && email.contains(".")) {
    print("mail");
    //pop up benzeri gelelbilir hataları yazmak için
    if (password.length > 5 && password == passwordAgain) {
      print("pass");
      if (nickName.length > 3) {
        userName = nickName;
        await createUserFirebase(email, password).then((value) =>
            value ? result = true : print("kayıt veri tabanına eklenemedi"));
      }
    }
  }
  return result;
}

Future<bool> createUserFirebase(String email, String password) async {
  try {
    currentUser = auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => FirebaseFirestore.instance
            .collection("user")
            .doc(value.user.email)
            .set({"email": email, "user_name": userName}));
    print("kullanıcı başarıyla oluşturuldu");

    return true;
  } on FirebaseAuthException catch (e) {
    print(e.message);
    return false;
  }
}

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
  dynamic states;
  FirebaseFirestore.instance
      .collection("user-status")
      .doc(userEmail)
      .get()
      .then((value) {
    states = (value.data());
    if (states != null) {
      isSpotifySelected.value = states["sp_status"];
      isSteamSelected.value = states["steam_status"];
    } else {
      print("states objesi boş döndü");
    }
  });
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
