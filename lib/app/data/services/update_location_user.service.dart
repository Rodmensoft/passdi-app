import 'package:get/instance_manager.dart';

import '../models/api_responde.dart';
import '../provider/update_location_user.provider.dart';

class UpdateLocationService {
  final UpdateLocationProvider api = Get.find();

  Future<ApiResponse> updateLocationUser({required Map<String, String> data}) =>
      api.updateLocationUser(data);
}
