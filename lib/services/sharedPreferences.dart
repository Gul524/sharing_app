import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static final SharedPreferencesService _instance = SharedPreferencesService._internal();
  late SharedPreferences _preferences;

  // Private constructor
  SharedPreferencesService._internal();

  // Factory constructor for singleton instance
  factory SharedPreferencesService() {
    return _instance;
  }

  // Initialize SharedPreferences
  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // Generic method to set a value
  Future<bool> setValue<T>(String key, T value) {
    if (value is String) {
      return _preferences.setString(key, value);
    } else if (value is int) {
      return _preferences.setInt(key, value);
    } else if (value is double) {
      return _preferences.setDouble(key, value);
    } else if (value is bool) {
      return _preferences.setBool(key, value);
    } else if (value is List<String>) {
      return _preferences.setStringList(key, value);
    } else {
      throw ArgumentError("Unsupported type");
    }
  }

  // Generic method to get a value
  T? getValue<T>(String key) {
    return _preferences.get(key) as T?;
  }

  // Remove a value
  Future<bool> removeValue(String key) async {
    return await _preferences.remove(key);
  }

  // Clear all stored data
  Future<bool> clearAll() async {
    return await _preferences.clear();
  }
}
