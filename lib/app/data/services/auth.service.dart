import 'package:app_viajeros/app/data/models/api_responde.dart';
import 'package:app_viajeros/app/data/models/register/register.dart';
import 'package:app_viajeros/app/data/provider/auth.provider.dart';
import 'package:get/instance_manager.dart';

class AuthService {
  final AuthProvider api = Get.find();

  Future<ApiResponse> login({required String email, password}) =>
      api.login(email, password);
  Future<ApiResponse> register(RegisterModel model) => api.register(model);
}
