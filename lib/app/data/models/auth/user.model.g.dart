// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int,
      name: json['name'] as String,
      birthDate: DateTime.parse(json['birth_date'] as String),
      document: json['document'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      profileVisible: json['profile_visible'] as int,
      notification: json['notification'] as int,
      location: json['location'] as String,
      occupationId: json['occupation_id'] as int,
      documentTypeId: json['document_type_id'] as int,
      nationalityId: json['nationality_id'] as int,
      civilStateId: json['civil_state_id'] as int,
      genderId: json['gender_id'] as int,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'birth_date': instance.birthDate.toIso8601String(),
      'document': instance.document,
      'phone': instance.phone,
      'email': instance.email,
      'profile_visible': instance.profileVisible,
      'notification': instance.notification,
      'location': instance.location,
      'occupation_id': instance.occupationId,
      'document_type_id': instance.documentTypeId,
      'nationality_id': instance.nationalityId,
      'civil_state_id': instance.civilStateId,
      'gender_id': instance.genderId,
    };
