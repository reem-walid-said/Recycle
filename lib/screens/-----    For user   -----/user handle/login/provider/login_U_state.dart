import 'package:flutter/material.dart';

class Login_U_State {
  //! vars
  String? email;
  String? password;
  String? token;

  //! controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //! errors
  //String? usernameErrorMessage;
  String? emailErrorMessage;
  String? passwordErrorMessage;

  //! bools
  bool hidePass = true;
  bool rememberMe = false;

  dynamic loginState;
}
