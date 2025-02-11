// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Feature _$FeatureFromJson(Map<String, dynamic> json) => Feature(
      title: json['title'] as String?,
      description: json['description'] as String?,
      softwareProduct: json['softwareProduct'] == null
          ? null
          : SoftwareProduct.fromJson(
              json['softwareProduct'] as Map<String, dynamic>),
    )
      ..id = json['id'] as String?
      ..softwareProductId = json['softwareProductId'] as String?;

Map<String, dynamic> _$FeatureToJson(Feature instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'softwareProduct': instance.softwareProduct,
      'softwareProductId': instance.softwareProductId,
    };
