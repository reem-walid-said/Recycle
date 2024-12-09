// ignore_for_file: non_constant_identifier_names

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:project/screens/-----For%20employe-----/user%20handle/register/provider/register_state.dart';

class CreateAccountProvider extends ChangeNotifier {
  // ignore: unused_field
  final CreateAccountState state = CreateAccountState();

  void onEmailChange(String value) {
    value.isEmpty
        ? state.emailErrorMessage = "You must enter a mail"
        : EmailValidator.validate(value)
            ? state.emailErrorMessage = null
            : state.emailErrorMessage = "Enter a valid mail";
    state.email = value;
    notifyListeners();
  }

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

  void RetypePasswordChange(String value) {
    value != state.password
        ? state.RetypepasswordErrorMessage = "You must enter a same  password"
        : state.RetypepasswordErrorMessage = null;
    state.Retypepassword = value;
    notifyListeners();
  }

  void nameChange(String value) {
    value.isEmpty
        ? state.usernameErrorMessage = "You must enter a Username"
        : state.usernameErrorMessage = null;
    state.name = value;
    notifyListeners();
  }

  void EducationalcodeChange(String value) {
    value.isEmpty
        ? state.EducationalcodeErrorMessage =
            "You must enter a Educational code"
        : state.EducationalcodeErrorMessage = null;
    state.Educationalcode = value;
    notifyListeners();
  }

  void onPhoneNumberChange(PhoneNumber value) {
    state.phoneNumber = value;
    notifyListeners();
  }

  void addressChange(String value) {
    value.isEmpty
        ? state.addressErrorMessage = "You must enter a address"
        : state.addressErrorMessage = null;
    state.address = value;
    notifyListeners();
  }

  void birthdayChange(String value) {
    value.isEmpty
        ? state.birthdayErrorMessage = "You must enter a birthday"
        : state.birthdayErrorMessage = null;
    state.name = value;
    notifyListeners();
  }

  void genderChange(String value) {
    value.isEmpty
        ? state.birthdayErrorMessage = "You must enter a birthday"
        : state.birthdayErrorMessage = null;
    state.name = value;
    notifyListeners();
  }

  void showPassword() {
    state.hidePass == true ? state.hidePass = false : state.hidePass = true;
    notifyListeners();
  }

  void showPassword2() {
    state.hidePass2 == true ? state.hidePass2 = false : state.hidePass2 = true;
    notifyListeners();
  }

  void onChangeterms(bool? value) async {
    state.terms = value!;

    notifyListeners();
  }

  // navigateToLogin(BuildContext context) {
  //   Navigator.of(context).pushReplacementNamed(AppRoutes.parents_login);
  // }

  // createAccount(BuildContext context) {
  //   Navigator.of(context)
  //       .pushNamedAndRemoveUntil(AppRoutes.parents_login, (route) => false);
  // }

  bool validate() {
    if (state.emailErrorMessage == null &&
        state.passwordErrorMessage == null &&
        state.EducationalcodeErrorMessage == null &&
        state.RetypepasswordErrorMessage == null &&
        state.email != null &&
        state.password != null &&
        state.Educationalcode != null &&
        // state.address != null &&
        // state.gender != null &&
        state.Retypepassword != null &&
        state.password == state.Retypepassword) {
      return true;
    } else {
      return false;
    }
  }
}
