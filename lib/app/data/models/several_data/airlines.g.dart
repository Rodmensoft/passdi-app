// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'airlines.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Airline _$AirlineFromJson(Map<String, dynamic> json) => Airline(
      id: json['id'] as int,
      iata: json['iata'] as String,
      icao: json['icao'] as String,
      name: json['airline'] as String,
      callsign: json['callsign'] as String,
      country: json['country'] as String,
    );

Map<String, dynamic> _$AirlineToJson(Airline instance) => <String, dynamic>{
      'id': instance.id,
      'iata': instance.iata,
      'icao': instance.icao,
      'airline': instance.name,
      'callsign': instance.callsign,
      'country': instance.country,
    };
