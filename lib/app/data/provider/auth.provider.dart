import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:passdi_app/app/data/models/register/register.dart';

import '../../constants/api_routes.dart';
import '../../constants/catch_errors.dart';
import '../models/api_responde.dart';
import '../services/shared_preferences.service.dart';

class AuthProvider {
  final Dio dio = Get.find();

  Future<ApiResponse> login(String email, password) async {
    try {
      final Map<String, dynamic> data = {
        'email': email,
        'password': password,
      };

      final Response response = await dio.post(
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
        ApiRoutes.login,
        data: data,
      );
      if (response.statusCode == 200) {
        savePrefs(json.encode(response.data['data']));
        return ApiResponse(
          message: '¡Bienvenido de vuelta!',
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

  Future<ApiResponse> register(RegisterModel model) async {
    try {
      final Map<String, dynamic> data = model.toJson();

      final Response response = await dio.post(
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
        ApiRoutes.registerUser,
        data: data,
      );
      if (response.statusCode == 200) {
        savePrefs(json.encode(response.data['data']['tokens']));
        return ApiResponse(
          message: '¡Registro exitoso!',
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

  Future<ApiResponse> update(RegisterModel model) async {
    try {
      final Map<String, dynamic> data = model.toJson();

      final Response response = await dio.post(
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'Authorization':
                'Bearer ${Get.find<SharedPreferencesService>().authData.accessToken}',
          },
        ),
        ApiRoutes.updateProfile,
        data: data,
      );
      if (response.statusCode == 200) {
        savePrefs(json.encode(response.data['data']['tokens']));
        return ApiResponse(
          message: '¡Actualización exitosa!',
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

  void savePrefs(String data) {
    final SharedPreferencesService prefs = Get.find();
    prefs.authDataString = data;
  }
}
