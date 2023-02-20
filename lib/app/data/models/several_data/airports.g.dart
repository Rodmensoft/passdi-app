// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'airports.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Airport _$AirportFromJson(Map<String, dynamic> json) => Airport(
      id: json['id'] as int,
      code: json['code'] as String,
      name: json['name'] as String,
      cityCode: json['city_code'] as String,
      cityName: json['city_name'] as String,
      countryName: json['country_name'] as String,
      countryCode: json['country_code'] as String,
      timezone: json['timezone'] as String,
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
      numberAirports: json['number_airports'] as int,
      city: json['city'] as String,
    );

Map<String, dynamic> _$AirportToJson(Airport instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'city_code': instance.cityCode,
      'city_name': instance.cityName,
      'country_name': instance.countryName,
      'country_code': instance.countryCode,
      'timezone': instance.timezone,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'number_airports': instance.numberAirports,
      'city': instance.city,
    };
