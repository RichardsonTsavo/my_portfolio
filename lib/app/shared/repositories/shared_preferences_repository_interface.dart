import 'package:flutter/material.dart';

abstract class ISharedPreferencesRepositoryInterface{
  Future setString({@required String key, String value});
  Future setBool({@required String key, bool value});
  Future setDouble({@required String key, double value});
  Future getString({@required String key});
  Future getBool({@required String key});
  Future getDouble({@required String key});
  Future deleteData({@required String key});
}