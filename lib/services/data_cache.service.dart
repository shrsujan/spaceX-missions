import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataCacheService {
  DataCacheService({@required this.sharedPreferences});

  final SharedPreferences sharedPreferences;

  String getData(String key) {
    return sharedPreferences.getString(key);
  }

  Future<void> setData(String key, String data) async {
    await sharedPreferences.setString(key, data);
  }
}
