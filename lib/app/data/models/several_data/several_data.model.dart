import 'package:passdi_app/app/data/models/several_data/product.dart';
import 'package:json_annotation/json_annotation.dart';

import 'airlines.dart';
import 'airports.dart';
import 'document_types.dart';
import 'occupations.dart';

part 'several_data.model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SeveralData {
  @JsonKey(name: 'products')
  List<Product> nationality;
  List<Airport> airports;
  List<Airline> airlines;
  List<DropDownModel> documentTypes;
  List<Occupation> occupations;

  SeveralData({
    required this.nationality,
    required this.airports,
    required this.airlines,
    required this.documentTypes,
    required this.occupations,
  });

  factory SeveralData.fromJson(Map<String, dynamic> json) =>
      _$SeveralDataFromJson(json);
  Map<String, dynamic> toJson() => _$SeveralDataToJson(this);
}
