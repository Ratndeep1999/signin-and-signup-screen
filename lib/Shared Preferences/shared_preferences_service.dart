import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {

  // Object
  late final SharedPreferences? _prefs;

  // Initialization method
  Future<void> initializeSharedPref() async {
    _prefs = await SharedPreferences.getInstance();
  }
}