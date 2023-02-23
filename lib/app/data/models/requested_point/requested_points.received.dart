import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:passdi_app/utils/colors.dart';

part 'requested_points.received.g.dart';

List<RequestedPointsReceived> requestedPointsReceivedFromJsonList(String str) =>
    List<RequestedPointsReceived>.from(
        json.decode(str).map((x) => RequestedPointsReceived.fromJson(x)));
RequestedPointsReceived requestedPointsReceivedFromJson(String str) =>
    RequestedPointsReceived.fromJson(json.decode(str));

String requestedPointsReceivedToJsonList(List<RequestedPointsReceived> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
String requestedPointsReceivedToJson(RequestedPointsReceived data) =>
    json.encode(data.toJson());

@JsonSerializable(fieldRename: FieldRename.snake)
class RequestedPointsReceived {
  RequestedPointsReceived({
    required this.id,
    required this.reservationCode,
    required this.state,
    required this.point,
    required this.travelDate,
    required this.origin,
    required this.destination,
    required this.airline,
  });

  int id;
  String reservationCode;
  String state;
  int point;
  String travelDate;
  String origin;
  String destination;
  String airline;

  Color get stateColor => state == 'Pendiente' ? failed : primaryColor;

  factory RequestedPointsReceived.fromJson(Map<String, dynamic> json) =>
      _$RequestedPointsReceivedFromJson(json);
  Map<String, dynamic> toJson() => _$RequestedPointsReceivedToJson(this);
}
