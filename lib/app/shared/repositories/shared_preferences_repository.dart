import 'package:my_portfolio/app/shared/repositories/shared_preferences_repository_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesRepository implements ISharedPreferencesRepositoryInterface{
  SharedPreferences prefs;
  @override
  Future deleteData({String key}) async {
    if(prefs == null){
      prefs = await SharedPreferences.getInstance();
    }
    prefs.remove(key);
  }

  @override
  Future getString({String key}) async {
    if(prefs == null){
      prefs = await SharedPreferences.getInstance();
    }

    if (prefs.containsKey(key)) {
      return prefs.getString(key);
    }
  }

  @override
  Future getBool({String key}) async {
    if(prefs == null){
      prefs = await SharedPreferences.getInstance();
    }

    if (prefs.containsKey(key)) {
      return prefs.getBool(key);
    }
  }

  @override
  Future getDouble({String key}) async {
    if(prefs == null){
      prefs = await SharedPreferences.getInstance();
    }

    if (prefs.containsKey(key)) {
      return prefs.getDouble(key);
    }
  }

  @override
  Future setBool({String key, bool value}) async {
    if(prefs == null){
      prefs = await SharedPreferences.getInstance();
    }
    prefs.setBool(key, value);
  }

  @override
  Future setDouble({String key, double value}) async {
    if(prefs == null){
      prefs = await SharedPreferences.getInstance();
    }
    prefs.setDouble(key, value);
  }

  @override
  Future setString({String key, String value}) async {
    if(prefs == null){
      prefs = await SharedPreferences.getInstance();
    }
    prefs.setString(key, value);
  }

}