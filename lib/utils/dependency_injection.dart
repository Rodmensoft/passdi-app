import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../app/data/provider/points.provider.dart';
import '../app/data/services/points.service.dart';
import '../app/data/services/shared_preferences.service.dart';
import 'configs.dart';
import 'dependency_export.dart';

class DependencyInjection {
  static Future<void> init() async {
    await initSharedPrefs();
    Get.put(Dio(BaseOptions(baseUrl: BASE_URL)));

    Get.put(SeveralDataProvider());
    Get.put(SeveralDataService());

    Get.put(AuthProvider());
    Get.put(AuthService());

    Get.put(SaveRequestedPointProvider());
    Get.put(SaveRequestedPointService());

    Get.put(PointsProvider());
    Get.put(PointsService());
  }

  static Future<void> initSharedPrefs() async {
    Get.put(Prefs());
    Prefs shared = Get.find<Prefs>();
    await shared.initPrefs();
  }
}
