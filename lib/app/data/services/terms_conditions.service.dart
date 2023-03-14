import 'package:get/instance_manager.dart';
import 'package:passdi_app/app/data/provider/terms_conditions.provider.dart';

import '../models/api_responde.dart';

class TermsConditionsService {
  final TermsConditionsProvider api = Get.find();

  Future<ApiResponse> getTYC() => api.getTYC();
}
