import 'dart:convert';

import 'package:nb_utils/nb_utils.dart';
import 'package:passdi_app/app/data/models/auth/auth.model.dart';
import 'package:passdi_app/app/data/models/several_data/several_data.model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static final Prefs _instancia = Prefs._internal();
  late SharedPreferences _prefs;
  factory Prefs() => _instancia;
  Prefs._internal();

  String get severalDataString => _prefs.getString('severalData') ?? '';
  set severalDataString(String value) => _prefs.setString('severalData', value);
  SeveralData? get severalData {
    if (severalDataString.isEmpty) return null;
    return SeveralData.fromJson(json.decode(severalDataString));
  }

  String get authDataString => _prefs.getString('authData') ?? '';
  set authDataString(String value) => _prefs.setString('authData', value);

  Auth get authData {
    return authFromJson(authDataString);
  }

  Future<void> clear() async {
    await _prefs.clear();
  }

  Future<SharedPreferences> initPrefs() async =>
      _prefs = await SharedPreferences.getInstance();
}
