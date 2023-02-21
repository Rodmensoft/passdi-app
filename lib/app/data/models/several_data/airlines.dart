import 'package:json_annotation/json_annotation.dart';

part 'airlines.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Airline {
  Airline({
    required this.id,
    required this.iata,
    required this.icao,
    required this.name,
    required this.callsign,
    required this.country,
  });

  int id;
  String iata;
  String icao;
  @JsonKey(name: 'airline')
  String name;
  String callsign;
  String country;

  factory Airline.fromJson(Map<String, dynamic> json) =>
      _$AirlineFromJson(json);
  Map<String, dynamic> toJson() => _$AirlineToJson(this);
}
