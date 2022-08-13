import 'package:shared_preferences/shared_preferences.dart';
import 'package:udemy_course/presentaion/resources/language_manager.dart';

const String PREFS_KEY_LANG = "PREFS_KEY_LANG";

class AppPrefrences {
  final SharedPreferences _sharedPreferences;
  AppPrefrences(this._sharedPreferences);
  Future<String> getAppLanguage() async {
    String? language = _sharedPreferences.getString(PREFS_KEY_LANG);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      //return defualt language
      return languageType.ENGLISH.getValue();
    }
  }
}
