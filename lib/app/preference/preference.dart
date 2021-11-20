import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppPreferenceManager {
  FlutterSecureStorage _storage;
  IOSOptions _iOptions;

  AppPreferenceManager() {
    _storage = FlutterSecureStorage();

    if (Platform.isIOS) {
      // iOS: This allows us to be able to fetch secure values while the app is backgrounded
      _iOptions = IOSOptions(accessibility: IOSAccessibility.first_unlock);
    }
  }

  Future<String> read(String key) {
    return _storage.read(key: key, iOptions: _iOptions);
  }

  Future<Map<String, String>> readAll(String key) {
    return _storage.readAll(iOptions: _iOptions);
  }

  Future<void> write(String key, String value) {
    return _storage.write(key: key, value: value, iOptions: _iOptions);
  }

  Future<void> delete(String key) {
    return _storage.delete(key: key, iOptions: _iOptions);
  }

  Future<void> deleteAll() {
    return _storage.deleteAll(iOptions: _iOptions);
  }
}
