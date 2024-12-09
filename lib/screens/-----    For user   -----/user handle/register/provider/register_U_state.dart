// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class CreateAccountState_U {
  //! vars
  String? name;
  String? email;
  String? password;
  String? Retypepassword;
  String? Educationalcode;
  PhoneNumber? phoneNumber;
  String? address;
  String? birthday = "0000-00-00";
  String? gender;
  DateTime? Datetime;

  //! controllers
  TextEditingController EducationalcodeController = TextEditingController();
  TextEditingController UsernameController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController RetypepasswordController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  //! errors
  String? usernameErrorMessage;
  String? emailErrorMessage;
  String? passwordErrorMessage;
  String? RetypepasswordErrorMessage;
  String? phoneErrorMessage;
  String? addressErrorMessage;
  String? birthdayErrorMessage;
  String? genderErrorMessage;
  String? EducationalcodeErrorMessage;

  //! bools
  bool hidePass = true;
  bool hidePass2 = true;
  bool terms = false;
}
