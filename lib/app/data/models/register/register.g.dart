// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterModel _$RegisterModelFromJson(Map<String, dynamic> json) =>
    RegisterModel(
      name: json['name'] as String,
      nationalityId: json['nationality_id'] as int,
      occupationId: json['occupation_id'] as int,
      documentTypeId: json['document_type_id'] as int,
      birthDate: json['birth_date'] as String,
      document: json['document'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      genderId: json['gender_id'] as int,
      civilStateId: json['civil_state_id'] as int,
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$RegisterModelToJson(RegisterModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'nationality_id': instance.nationalityId,
      'occupation_id': instance.occupationId,
      'document_type_id': instance.documentTypeId,
      'birth_date': instance.birthDate,
      'document': instance.document,
      'email': instance.email,
      'password': instance.password,
      'gender_id': instance.genderId,
      'civil_state_id': instance.civilStateId,
      'phone': instance.phone,
    };
