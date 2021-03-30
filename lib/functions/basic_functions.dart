import 'package:soul_meter/widgets/text_box/default_text_box.dart';

void login(DefaultTextBoxWidget email, DefaultTextBoxWidget password) {
  if (   (email.getText.contains("@") &&   email.getText.contains(".")) ) {
    email.formKey.currentState.validate();}

     if(email.getText==('')){
       email.formKey.currentState.validate();
     }
     if(password.getText==('')){
       password.formKey.currentState.validate();
     }
      if (!(password.getText.length > 5)) {
       password.formKey.currentState.validate();

      }

  }

  void createAccount(
      DefaultTextBoxWidget nickName, DefaultTextBoxWidget email, DefaultTextBoxWidget password, DefaultTextBoxWidget passwordAgain) {
    
    
  if (   (email.getText.contains("@") &&   email.getText.contains(".")) ) {
    email.formKey.currentState.validate();}

     if(email.getText==('')){
       email.formKey.currentState.validate();
     }
     if(password.getText==('')){
       password.formKey.currentState.validate();
     }
     if(nickName.getText==('')){
       nickName.formKey.currentState.validate();
     }
     if(passwordAgain.getText==('')){
       passwordAgain.formKey.currentState.validate();
     }
      if (!(password.getText.length > 5 && password.getText==passwordAgain)) {
               password.formKey.currentState.validate();

      }
      if(nickName.getText<3){}
nickName.formKey.currentState.validate();
  }
