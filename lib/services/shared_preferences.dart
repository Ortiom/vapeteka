import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static SharedPreferences? _sharedPreferences;

  static const _token = 'token';
  static const _fcmToken = 'fcmToken';
  static const _discount = 'discount';

  static Future init() async =>
      _sharedPreferences = await SharedPreferences.getInstance();

  static Future setToken(String data) async =>
      _sharedPreferences?.setString(_token, data);
  static String getToken() => _sharedPreferences?.getString(_token) ?? '';

  static Future setFcmToken(String data) async =>
      _sharedPreferences?.setString(_fcmToken, data);
  static String getFcmToken() => _sharedPreferences?.getString(_fcmToken) ?? '';

  static Future setDiscountBool(bool data) async =>
      _sharedPreferences?.setBool(_discount, data);
  static bool getDiscountBool() =>
      _sharedPreferences?.getBool(_discount) ?? false;
}
