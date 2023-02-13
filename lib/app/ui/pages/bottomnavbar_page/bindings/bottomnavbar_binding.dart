import 'package:get/get.dart';

import '../../home_page/controllers/home_controller.dart';
import '../../location_page/controllers/location_controller.dart';
import '../../profile_page/controllers/profile_controller.dart';
import '../../score_page/controllers/score_controller.dart';
import '../../users_page/controllers/users_controller.dart';
import '../controllers/bottomnavbar_controller.dart';

class BottomNavbarBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavbarController>(() => BottomNavbarController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<UsersController>(() => UsersController());
    Get.lazyPut<LocationController>(() => LocationController());
    Get.lazyPut<ScoreController>(() => ScoreController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
