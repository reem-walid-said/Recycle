import 'package:shared_preferences/shared_preferences.dart';
/*
  Keys:
    - uid

 */


class CacheHelper{

  static SharedPreferences? _sharedPreferences;

  static init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  /* Set Methods */

  static Future <bool?> SetID({
    required String id,
  }) async {
    return await _sharedPreferences?.setString("id", id);
  }

  static Future <bool?> SetFirstTimeValue({
    required bool value,
  }) async {
    return await _sharedPreferences?.setBool("onBoarding", value);
  }

  static Future <bool?> SetUserType({
    required String type,
  }) async {
    return await _sharedPreferences?.setString("userType", type);
  }


  /* Get Methods */

  static String? GetID() => _sharedPreferences?.getString("id");
  static bool? firstTimeInstall() => _sharedPreferences?.getBool("onBoarding");
  static String? getUserType() => _sharedPreferences?.getString("userType");


  /* Delete Methods */

  static Future DeleteKey({
    required String key,
  }) async {
    return await _sharedPreferences?.remove(key);
  }

}