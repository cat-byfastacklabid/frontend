import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPreferencesConfig {
  Future<bool> setString(String key, String value);
  String? getString(String key);

  Future<bool> setMap(String key, Map<String, dynamic> value);
  Map<String, dynamic>? getMap(String key);

  Future<bool> setList(String key, List value);
  List? getList(String key);

  Future<bool> clearData();
}

@LazySingleton(as: SharedPreferencesConfig)
class SharedPreferencesConfigImpl implements SharedPreferencesConfig {
  final SharedPreferences sp;

  const SharedPreferencesConfigImpl(this.sp);

  @override
  Future<bool> setString(String key, String value) async =>
      await sp.setString(key, value);

  @override
  String? getString(String key) => sp.getString(key);

  @override
  Future<bool> clearData() async => await sp.clear();

  @override
  Map<String, dynamic>? getMap(String key) {
    if (sp.getString(key) != null) {
      return json.decode(sp.getString(key)!);
    }

    return null;
  }

  @override
  Future<bool> setMap(String key, Map<String, dynamic> value) async {
    if (value.keys.isEmpty) {
      return false;
    }

    return await sp.setString(key, json.encode(value));
  }

  @override
  List? getList(String key) {
    if (sp.getString(key) != null) {
      return json.decode(sp.getString(key)!);
    }

    return null;
  }

  @override
  Future<bool> setList(String key, List value) async {
    if (value.isEmpty) {
      return false;
    }

    return await sp.setString(key, json.encode(value));
  }
}
