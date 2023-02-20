import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Product {
  Product({
    required this.id,
    required this.name,
    required this.demonym,
    required this.iso,
  });

  int id;
  @JsonKey(name: 'country')
  String name;
  String demonym;
  String iso;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
