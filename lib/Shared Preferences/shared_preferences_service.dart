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



}