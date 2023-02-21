import 'dart:convert';

import 'package:passdi_app/app/data/models/auth/user.model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth.model.g.dart';

Auth authFromJson(String str) => Auth.fromJson(json.decode(str));

String authToJsonList(List<Auth> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
String authToJson(Auth data) => json.encode(data.toJson());

@JsonSerializable(fieldRename: FieldRename.snake)
class Auth {
  Auth({
    required this.tokenType,
    required this.expiresIn,
    required this.accessToken,
    required this.refreshToken,
    required this.user,
  });

  String tokenType;
  int expiresIn;
  String accessToken;
  String refreshToken;
  User user;
  factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);
  Map<String, dynamic> toJson() => _$AuthToJson(this);
}
