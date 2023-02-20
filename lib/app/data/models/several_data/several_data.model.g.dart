// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'several_data.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeveralData _$SeveralDataFromJson(Map<String, dynamic> json) => SeveralData(
      products: (json['products'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      airports: (json['airports'] as List<dynamic>)
          .map((e) => Airport.fromJson(e as Map<String, dynamic>))
          .toList(),
      airlines: (json['airlines'] as List<dynamic>)
          .map((e) => Airline.fromJson(e as Map<String, dynamic>))
          .toList(),
      documentTypes: (json['document_types'] as List<dynamic>)
          .map((e) => DropDownModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      occupations: (json['occupations'] as List<dynamic>)
          .map((e) => Occupation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SeveralDataToJson(SeveralData instance) =>
    <String, dynamic>{
      'products': instance.products,
      'airports': instance.airports,
      'airlines': instance.airlines,
      'document_types': instance.documentTypes,
      'occupations': instance.occupations,
    };
