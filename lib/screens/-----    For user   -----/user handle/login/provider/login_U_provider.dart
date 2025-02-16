import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/core/components.dart';
import 'package:project/screens/-----%20%20%20%20For%20user%20%20%20-----/home/provider/user_provider.dart';
import 'package:project/screens/-----%20%20%20%20For%20user%20%20%20-----/user%20handle/login/provider/login_U_state.dart';
import 'package:project/screens/-----For%20employe-----/user%20handle/login/provider/login_E_state.dart';
import 'package:project/services/network/authentication.dart';

class Login_U_Provider extends ChangeNotifier {
  Login_U_State state = Login_U_State();

  void onPasswordChange(String value) {
    value.isEmpty
        ? state.passwordErrorMessage = "You must enter a password"
        : value.length < 8
            ? state.passwordErrorMessage =
                "Password must be at least 8 characters"
            : state.passwordErrorMessage = null;
    state.password = value;
    notifyListeners();
  }

  // void onUsernameChange(String value) {
  //   value.isEmpty
  //       ? state.usernameErrorMessage = "You must enter a username"
  //       : state.usernameErrorMessage = null;
  //   state.email = value;
  //   notifyListeners();
  // }

  void onEmailChange(String value) {
    value.isEmpty
        ? state.emailErrorMessage = "You must enter a email"
        : state.emailErrorMessage = null;
    state.email = value;
    notifyListeners();
  }

  void showPassword() {
    state.hidePass == true ? state.hidePass = false : state.hidePass = true;
    notifyListeners();
  }

  bool validate() {
    print(state.email);
    print(state.password);

    if (state.passwordErrorMessage == null &&
        state.emailErrorMessage == null &&
        state.password != null &&
        state.email != null) {
      return true;
    } else {
      myToast(
        message: "Email or Password is not valid",
        backgroundColor: Colors.red,
      );
      return false;
    }
  }


  Future Login(context) async {
    state.loginState = await AuthServices().signInWithEmailAndPassword(
        email: state.email, password: state.password);
    if (state.loginState is UserCredential) {
      print(state.loginState);

      return state.loginState.user?.uid;
    } else {
      await myToast(
        message: state.loginState,
        backgroundColor: Colors.red,
      );
      return false;
    }
  }

  // navigateToRegister(BuildContext context) {
  //   Navigator.of(context).pushReplacementNamed(AppRoutes.Parents_createaccount);
  // }

  // logIn(BuildContext context) {
  //   Navigator.of(context)
  //       .pushNamedAndRemoveUntil(AppRoutes.Parents_home, (route) => false);
  // }

  void onChangeRememberMe(bool? value) async {
    state.rememberMe = value!;

    notifyListeners();
  }
}
