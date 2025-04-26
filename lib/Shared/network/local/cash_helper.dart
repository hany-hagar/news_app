import 'package:shared_preferences/shared_preferences.dart';

class CashHelper {
  static SharedPreferences? sharedPreferences;

  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool?> putBool({
    required String key,
    required bool value,
  }) async {
    await sharedPreferences?.setBool(key, value);
    return null;
  }
  static Future<bool?> get({
    required String key,
  }) async {
    return sharedPreferences?.getBool(key);
  }
}
