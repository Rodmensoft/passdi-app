import 'dart:convert';

import 'package:get/route_manager.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:passdi_app/app/data/models/auth/auth.model.dart';
import 'package:passdi_app/app/data/models/several_data/several_data.model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../routes/app_routes.dart';

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

  int get userNumberPoints => _prefs.getInt('numberPoints') ?? 0;
  set userNumberPoints(int value) => _prefs.setInt('numberPoints', value);

  Future<void> clear() async {
    await _prefs.clear();
  }

  Future<SharedPreferences> initPrefs() async =>
      _prefs = await SharedPreferences.getInstance();

  Future<void> logout() async {
    final String severalDataTemp = severalDataString;
    clear();
    severalDataString = severalDataTemp;
    await Get.offAndToNamed(AppRoutes.AUTH);
  }
}
