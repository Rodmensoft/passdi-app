import 'dart:convert';

import 'package:passdi_app/app/data/models/several_data/several_data.model.dart';
import 'package:passdi_app/app/data/services/shared_preferences.service.dart';
import 'package:get/instance_manager.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.model.g.dart';

List<User> userFromJsonList(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));
User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJsonList(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
String userToJson(User data) => json.encode(data.toJson());

@JsonSerializable(fieldRename: FieldRename.snake)
class User {
  User({
    required this.id,
    required this.name,
    required this.birthDate,
    required this.document,
    required this.phone,
    required this.email,
    required this.profileVisible,
    required this.notification,
    required this.location,
    required this.occupationId,
    required this.documentTypeId,
    required this.nationalityId,
    required this.civilStateId,
    required this.genderId,
  });

  int id;
  String name;
  DateTime birthDate;
  String document;
  String phone;
  String email;
  int profileVisible;
  int notification;
  String location;
  int occupationId;
  int documentTypeId;
  int nationalityId;
  int civilStateId;
  int genderId;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  SeveralData get severalData =>
      Get.find<SharedPreferencesService>().severalData!;

  String get documentType => severalData.documentTypes
      .firstWhere((element) => element.id == documentTypeId)
      .name;
}
