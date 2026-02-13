import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesServices {
  /// Singleton of This Class
  static final SharedPreferencesServices _instance = // static instance
      SharedPreferencesServices._internal();

  SharedPreferencesServices._internal(); // named constructor

  factory SharedPreferencesServices() => _instance; // return same instance

  static SharedPreferences? _prefs;

  Future<SharedPreferences> get initSharedPref async =>
      _prefs ??= await SharedPreferences.getInstance();

  static const String _kIsLoggedIn = 'is_logged_in';

  Future<void> setIsLoggedIn({required bool value}) async {
    final prefs = await initSharedPref;
    await prefs.setBool(_kIsLoggedIn, value);
  }

  Future<bool> getLoggedInStatus() async {
    final prefs = await initSharedPref;
    return prefs.getBool(_kIsLoggedIn) ?? false;
  }

  Future<void> clearLoginData() async {
    final prefs = await initSharedPref;
    await prefs.remove(_kIsLoggedIn);
  }
}
