// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'occupations.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Occupation _$OccupationFromJson(Map<String, dynamic> json) => Occupation(
      id: json['id'] as int,
      name: json['name'] as String,
      state: json['state'] as int,
    );

Map<String, dynamic> _$OccupationToJson(Occupation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'state': instance.state,
    };
