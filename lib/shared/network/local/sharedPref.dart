import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

// dio or sharedpref steps
//1-class
//2-initialize tool
//3-needed funcs {get , post ,put }

class CachHelper {
  static SharedPreferences? sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> putBooleandata({required key, required value}) async {
    return await sharedPreferences!.setBool(key, value);
  }

  static dynamic getdata({required key}) {
    return sharedPreferences!.get(key);
  }

// saveData with any type
  static Future<bool> Savedata({required String key, required value}) async {

    if (value is bool) return await sharedPreferences!.setBool(key, value);
    if (value is String) return await sharedPreferences!.setString(key, value);
    if (value is int) return await sharedPreferences!.setInt(key, value);
    if (value is List<String>) return await sharedPreferences!.setStringList(key, value);
     return await sharedPreferences!.setDouble(key, value);
  }

  static  Future<bool> removeKey({required String key})async{
        return await sharedPreferences!.remove(key);
      }
}

