import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:async';

void login(String email, String password) {
  if (email.contains("@") && email.contains(".")) {
    //pop up benzeri gelelbilir hataları yazmak için
    if (password.length > 5) {
      if (fireBaseAuth(email, password)) {
        if (sendEmailToServer(email)) {}
      }
    }
  }
}

bool sendEmailToServer(String email) {
  //başarılı girişte kullanıcı e maili gönderilir
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
        if (createUserFirebase(email, password)) {
          if (sendNewUserToServer(email, nickName)) {}
        }
      }
    }
  }
}

bool createUserFirebase(String email, String password) {}

bool sendNewUserToServer(String email, String nickName) {}

double rateFuction(String user1, String user2) {
  //server a karşılaştıralacak verileri gönderip al
}

Future<String> getSpotifyData(String id) async {
  var result = await http.get(Uri.http("localhost:8080", "/deneme"));
  return result.body;
}
