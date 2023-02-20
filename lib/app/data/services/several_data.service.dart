import 'package:app_viajeros/app/data/models/api_responde.dart';
import 'package:app_viajeros/app/data/provider/several_data.provider.dart';
import 'package:get/instance_manager.dart';

class SeveralDataService {
  final SeveralDataProvider api = Get.find();

  Future<ApiResponse> getSeveralData() async => api.getSeveralData();
}
