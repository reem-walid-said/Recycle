import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/core/components.dart';
import 'package:project/screens/-----For%20employe-----/user%20handle/forget%20pass/provider/forget_E_state.dart';
import 'package:project/services/network/authentication.dart';

class ForgetPass_U_provider extends ChangeNotifier {
  ForgetPass_E_state state = ForgetPass_E_state();

  Future onSendingEmail() async {
      dynamic result = await AuthServices().forgetPasswordSendingEmail(state.forgetpasswordController.text);

      if(result is String){
        myToast(
          message: result,
          backgroundColor: Colors.red
        );
        return false;
      }

      else{
        return true;
      }
  }

}
