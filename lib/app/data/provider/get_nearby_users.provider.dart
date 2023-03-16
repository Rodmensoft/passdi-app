import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/instance_manager.dart';
import 'package:passdi_app/app/data/models/auth/user.model.dart';

import '../../constants/api_routes.dart';
import '../../constants/catch_errors.dart';
import '../models/api_responde.dart';
import '../services/shared_preferences.service.dart';

class NearbyUsersProvider {
  final Dio dio = Get.find();

  Future<ApiResponse> getNearbyUsers() async {
    try {
      final Response response = await dio.get(
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${Get.find<Prefs>().authData.accessToken}',
          },
        ),
        data: {"country": "Perú", "city": "Arequipa"},
        ApiRoutes.getNearbyUsers,
      );
      if (response.statusCode == 200) {
        var data = json.encode(response.data['data']);
        if (kDebugMode) {
          print(data);
        }
        return ApiResponse(
          data: userFromJsonList(data),
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
}
