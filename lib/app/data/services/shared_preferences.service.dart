import 'dart:convert';

import 'package:app_viajeros/app/data/models/several_data/several_data.model.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static final SharedPreferencesService _instancia =
      SharedPreferencesService._internal();
  late SharedPreferences _prefs;
  factory SharedPreferencesService() => _instancia;
  SharedPreferencesService._internal();

  String get severalDataString => _prefs.getString('severalData') ?? '';
  set severalDataString(String value) => _prefs.setString('severalData', value);
  SeveralData? get severalData {
    if (severalDataString.isEmpty) return null;
    return SeveralData.fromJson(json.decode(severalDataString));
  }

  String get authDataString => _prefs.getString('authData') ?? '';
  set authDataString(String value) => _prefs.setString('authData', value);

  Future<void> clear() async {
    await _prefs.clear();
  }

  Future<SharedPreferences> initPrefs() async =>
      _prefs = await SharedPreferences.getInstance();
}
