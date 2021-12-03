import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static SharedPreferences? _sharedPreferences;

  static const _token = 'token';

  static Future init() async =>
      _sharedPreferences = await SharedPreferences.getInstance();

  static Future setToken(String data) async =>
      _sharedPreferences?.setString(_token, data);

  static String getToken() => _sharedPreferences?.getString(_token) ?? '';
}
