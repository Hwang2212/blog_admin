import 'package:Blog_web/models/models.dart';
import 'package:Blog_web/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static SharedPreferences? _sharedPreferences;
  static SharedPreferencesService? _instance;

  // Initialize Shared Preferences
  static Future<SharedPreferencesService> getInstance() async {
    if (_instance != null) return _instance!;
    _sharedPreferences =
        _sharedPreferences ?? await SharedPreferences.getInstance();
    _instance = SharedPreferencesService();
    return _instance!;
  }

  // Key-pair Values Getter and Setter
  bool getIsFirstTime() {
    return _sharedPreferences!.getBool(Constants.isFirstTime) ?? true;
  }

  bool getLoggedIn() {
    return _sharedPreferences!.getBool(Constants.loggedIn) ?? true;
  }

  Future<bool> setIsNotFirstTime() async {
    return _sharedPreferences!.setBool(Constants.isFirstTime, false);
  }

  Future<bool> clear() async {
    return _sharedPreferences!.clear();
  }

  Future<bool> setLogIn() {
    return _sharedPreferences!.setBool(Constants.loggedIn, true);
  }
}
