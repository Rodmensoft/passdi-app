import 'package:json_annotation/json_annotation.dart';

part 'document_types.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class DropDownModel {
  DropDownModel({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory DropDownModel.fromJson(Map<String, dynamic> json) =>
      _$DropDownModelFromJson(json);
  Map<String, dynamic> toJson() => _$DropDownModelToJson(this);
}
