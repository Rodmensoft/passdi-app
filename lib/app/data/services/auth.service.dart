import 'package:passdi_app/app/data/models/api_responde.dart';
import 'package:passdi_app/app/data/models/register/register.dart';
import 'package:passdi_app/app/data/provider/auth.provider.dart';
import 'package:get/instance_manager.dart';

class AuthService {
  final AuthProvider api = Get.find();

  Future<ApiResponse> login({required String email, password}) =>
      api.login(email, password);
  Future<ApiResponse> register(RegisterModel model) => api.register(model);
  Future<ApiResponse> update(RegisterModel model) => api.update(model);
}
