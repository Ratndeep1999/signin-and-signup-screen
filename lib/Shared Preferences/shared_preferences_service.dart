import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  // Object
  late final SharedPreferences? _prefs;

  // Initialization method
  Future<void> initializeSharedPref() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Static keys
  static const String kFullName = 'fullName';
  static const String kEmailId = 'emailId';
  static const String kUserName = 'userName';
  static const String kBirthday = 'birthday';
  static const String kPassword = 'password';
  static const String kPhoneNumber = 'phoneNumber';
  static const String kSecurityQue = 'securityQue';
  static const String kSecurityAns = 'securityAns';
  static const String kIsUserLoggedIn = 'isUserLoggedIn';

  // Method to store Signup Data
  Future<void> saveSignupData({
    required firstName,
    required emailId,
    required userName,
    required birthday,
    required password,
    required phoneNumber,
    required securityQue,
    required securityAns,
  }) async {
    await _prefs?.setString(kFullName, firstName);
    await _prefs?.setString(kEmailId, emailId);
    await _prefs?.setString(kUserName, userName);
    await _prefs?.setString(kBirthday, birthday);
    await _prefs?.setString(kPassword, password);
    await _prefs?.setString(kPhoneNumber, phoneNumber);
    await _prefs?.setString(kSecurityQue, securityQue);
    await _prefs?.setString(kSecurityAns, securityAns);
  }

  // Method to Store Single String Data
  Future<void> setPrefString({required key, required value}) async {
    await _prefs?.setString(key, value);
  }

  // Method to Store Single Bool Data
  Future<void> setPrefBool({required key, required value}) async {
    await _prefs?.setString(key, value);
  }

  // Method to Retrieve/Get Single String Data
  void getPrefString({required key}){
    _prefs?.getString(key);
  }

  // Method to Retrieve/Get Single Bool Data
  void getPrefBool({required key}){
    _prefs?.getBool(key);
  }

}
