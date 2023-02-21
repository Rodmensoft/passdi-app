import 'package:json_annotation/json_annotation.dart';

part 'requested_point.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RequestedPointsModel {
  RequestedPointsModel({
    required this.reservationCode,
    required this.travelDate,
    required this.airportOriginId,
    required this.airportDestinationId,
    required this.airlineId,
  });

  String reservationCode;
  String travelDate;
  int airportOriginId;
  int airportDestinationId;
  int airlineId;

  factory RequestedPointsModel.fromJson(Map<String, dynamic> json) =>
      _$RequestedPointsModelFromJson(json);
  Map<String, dynamic> toJson() => _$RequestedPointsModelToJson(this);
}
