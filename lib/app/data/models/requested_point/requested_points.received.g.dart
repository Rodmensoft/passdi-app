// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'requested_points.received.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestedPointsReceived _$RequestedPointsReceivedFromJson(
        Map<String, dynamic> json) =>
    RequestedPointsReceived(
      id: json['id'] as int,
      reservationCode: json['reservation_code'] as String,
      state: json['state'] as String,
      point: json['point'] as int,
      travelDate: json['travel_date'] as String,
      origin: json['origin'] as String,
      destination: json['destination'] as String,
      airline: json['airline'] as String,
    );

Map<String, dynamic> _$RequestedPointsReceivedToJson(
        RequestedPointsReceived instance) =>
    <String, dynamic>{
      'id': instance.id,
      'reservation_code': instance.reservationCode,
      'state': instance.state,
      'point': instance.point,
      'travel_date': instance.travelDate,
      'origin': instance.origin,
      'destination': instance.destination,
      'airline': instance.airline,
    };
