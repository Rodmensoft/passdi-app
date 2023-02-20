import 'package:json_annotation/json_annotation.dart';

part 'occupations.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Occupation {
  Occupation({
    required this.id,
    required this.name,
    required this.state,
  });

  int id;
  String name;
  int state;

  factory Occupation.fromJson(Map<String, dynamic> json) =>
      _$OccupationFromJson(json);
  Map<String, dynamic> toJson() => _$OccupationToJson(this);
}
