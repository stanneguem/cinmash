import 'package:get/get.dart';

import '../../../core/utils/formatters.dart';

class LoginControllers extends GetxController{
  var passwordVisible = false.obs;
  var isLoading = false.obs;
  var asError = false.obs;
  var asEmailError = false.obs;
  var asPasswordError = false.obs;
  var message = "".obs;
  var messagePassword = "".obs;

  Future<void> login(String email, String password) async {
    asEmailError.value = false;
    asPasswordError.value = false;
    if(email != "" && password != ""){
      asEmailError.value = false;
      asPasswordError.value = false;
      if(!isValidEmail(email)){
        asEmailError.value = true;
        message.value = "Le format de l'email est pas valide";
      }
      isLoading.value = true;
      try{
        if(email != "stannegueme@gmail.com" && password != "&Anrie237"){
          await Future.delayed(Duration(seconds: 5));
          isLoading.value = false;
          asError.value = true;
        }
      }catch(e){
        throw e.toString();
      }
    }
    if(email == "" || password == ""){
      asEmailError.value = true;
      asPasswordError.value = true;
      message.value = "Le champs email est requis";
      messagePassword.value = "Le champs Mot de passe est requis";

    }

    if(email == "" && password != ""){
      asEmailError.value = true;
      asPasswordError.value = false;
      message.value = "Le champs email est requis";
    }
    if(email != "" && password == ""){
      if(isValidEmail(email)){
        asEmailError.value = false;
        asPasswordError.value = true;
        messagePassword.value = "Le champs mot de passe est requis";
      }
      asEmailError.value = true;
      asPasswordError.value = true;
      messagePassword.value = "Le champs mot de passe est requis";
      message.value = "Le format de l'email est pas valide";
    }
  }

  void toggleVisibility(){
    passwordVisible.value = !passwordVisible.value;
  }
}