// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'requested_point.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestedPointsModel _$RequestedPointsModelFromJson(
        Map<String, dynamic> json) =>
    RequestedPointsModel(
      reservationCode: json['reservation_code'] as String,
      travelDate: json['travel_date'] as String,
      airportOriginId: json['airport_origin_id'] as int,
      airportDestinationId: json['airport_destination_id'] as int,
      airlineId: json['airline_id'] as int,
    );

Map<String, dynamic> _$RequestedPointsModelToJson(
        RequestedPointsModel instance) =>
    <String, dynamic>{
      'reservation_code': instance.reservationCode,
      'travel_date': instance.travelDate,
      'airport_origin_id': instance.airportOriginId,
      'airport_destination_id': instance.airportDestinationId,
      'airline_id': instance.airlineId,
    };
