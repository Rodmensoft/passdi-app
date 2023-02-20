import 'package:json_annotation/json_annotation.dart';

part 'airports.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Airport {
  Airport({
    required this.id,
    required this.code,
    required this.name,
    required this.cityCode,
    required this.cityName,
    required this.countryName,
    required this.countryCode,
    required this.timezone,
    required this.latitude,
    required this.longitude,
    required this.numberAirports,
    required this.city,
  });

  int id;
  String code;
  String name;
  String cityCode;
  String cityName;
  String countryName;
  String countryCode;
  String timezone;
  String latitude;
  String longitude;
  int numberAirports;
  String city;

  factory Airport.fromJson(Map<String, dynamic> json) =>
      _$AirportFromJson(json);
  Map<String, dynamic> toJson() => _$AirportToJson(this);
}
