import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'register.g.dart';

List<RegisterModel> registerFromJsonList(String str) =>
    List<RegisterModel>.from(
        json.decode(str).map((x) => RegisterModel.fromJson(x)));
RegisterModel registerFromJson(String str) =>
    RegisterModel.fromJson(json.decode(str));

String registerToJsonList(List<RegisterModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
String registerToJson(RegisterModel data) => json.encode(data.toJson());

@JsonSerializable(fieldRename: FieldRename.snake)
class RegisterModel {
  String name;
  int nationalityId;
  int occupationId;
  int documentTypeId;
  String birthDate;
  String document;
  String email;
  @JsonKey(includeIfNull: false)
  String? password;
  int genderId;
  int civilStateId;
  String phone;

  RegisterModel({
    required this.name,
    required this.nationalityId,
    required this.occupationId,
    required this.documentTypeId,
    required this.birthDate,
    required this.document,
    required this.email,
    this.password,
    required this.genderId,
    required this.civilStateId,
    required this.phone,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterModelFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterModelToJson(this);
}
