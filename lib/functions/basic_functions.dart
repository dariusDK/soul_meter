void login(String email, String password) {
  if (email.contains("@") && email.contains(".")) {
    //pop up benzeri gelelbilir hataları yazmak için
    if (password.length > 5) {}
  }
}

void createAccount(
    String nickName, String email, String password, String passwordAgain) {
  if (email.contains("@") && email.contains(".")) {
    print("mail");
    //pop up benzeri gelelbilir hataları yazmak için
    if (password.length > 5 && password == passwordAgain) {
      print("pass");
      if (nickName.length > 3) {}
    }
  }
}
