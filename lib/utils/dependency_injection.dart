import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../app/data/services/geolocator.service.dart';
import 'configs.dart';
import 'dependency_export.dart';

class DependencyInjection {
  static Future<void> init() async {
    await initSharedPrefs();
    Get.put(Dio(BaseOptions(baseUrl: BASE_URL)));

    Get.put(GeolocatorService());

    Get.put(SeveralDataProvider());
    Get.put(SeveralDataService());

    Get.put(AuthProvider());
    Get.put(AuthService());

    Get.put(SaveRequestedPointProvider());
    Get.put(SaveRequestedPointService());

    Get.put(PointsProvider());
    Get.put(PointsService());

    Get.put(TermsConditionsProvider());
    Get.put(TermsConditionsService());

    Get.put(UpdateLocationProvider());
    Get.put(UpdateLocationService());

    Get.put(NearbyUsersProvider());
    Get.put(NearbyUsersService());
  }

  static Future<void> initSharedPrefs() async {
    Get.put(Prefs());
    Prefs shared = Get.find<Prefs>();
    await shared.initPrefs();
  }
}
