import 'package:get/instance_manager.dart';
import 'package:passdi_app/app/data/provider/get_nearby_users.provider.dart';

class NearbyUsersService {
  final NearbyUsersProvider api = Get.find();

  getNearbyUsers() => api.getNearbyUsers();
}
