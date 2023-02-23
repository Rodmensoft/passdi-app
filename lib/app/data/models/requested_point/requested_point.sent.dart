import 'package:json_annotation/json_annotation.dart';

part 'requested_point.sent.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RequestedPointsModelSent {
  RequestedPointsModelSent({
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

  factory RequestedPointsModelSent.fromJson(Map<String, dynamic> json) =>
      _$RequestedPointsModelSentFromJson(json);
  Map<String, dynamic> toJson() => _$RequestedPointsModelSentToJson(this);
}
