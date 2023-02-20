import 'package:app_viajeros/app/data/models/api_responde.dart';
import 'package:dio/dio.dart';

ApiResponse catchErrors(DioError e) {
  const String checkInternetMessage =
      'Revise su conexión a Internet y vuelva a intentarlo.';

  String errorMessage = 'Unknown';

  if (e.type.name == 'other') {
    errorMessage = checkInternetMessage;
  } else if (e.type.name == 'connectTimeout') {
    errorMessage = 'Se acabo el tiempo de espera. $checkInternetMessage';
  } else if (e.response?.data is String) {
    errorMessage = e.response?.data;
  } else if (e.response?.data['data'] is String) {
    errorMessage = e.response?.data['data'];
  } else {
    errorMessage = e.response?.data['message'] ?? e.message;
  }

  return ApiResponse(
    message: errorMessage,
    success: false,
  );
}
