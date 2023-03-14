import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/instance_manager.dart';

import '../../constants/api_routes.dart';
import '../../constants/catch_errors.dart';
import '../models/api_responde.dart';

class TermsConditionsProvider {
  final Dio dio = Get.find();
  Future<ApiResponse> getTYC() async {
    try {
      final Response response = await dio.get(ApiRoutes.getTYC);
      if (response.statusCode == 200) {
        return ApiResponse(
          data: await descargarArchivoTxt(response.data['data']['data']),
          message: 'Éxito',
          success: true,
        );
      }
      return ApiResponse(
        message: 'Failed',
        success: false,
      );
    } on DioError catch (e) {
      return catchErrors(e);
    }
  }

  Future<String> descargarArchivoTxt(String url) async {
    try {
      final response = await dio.get(
        url,
        options: Options(responseType: ResponseType.plain),
      );
      return response.data.toString();
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return '';
    }
  }
}
