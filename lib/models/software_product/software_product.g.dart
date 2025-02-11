// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'software_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SoftwareProduct _$SoftwareProductFromJson(Map<String, dynamic> json) =>
    SoftwareProduct(
      name: json['name'] as String?,
      description: json['description'] as String?,
      vendor: json['vendor'] as String?,
      rating: (json['rating'] as num?)?.toInt(),
      review: json['review'] as String?,
      sectors: (json['sectors'] as List<dynamic>?)
          ?.map((e) => SectorProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
      projectStage: json['projectStage'] as String?,
      professions: (json['professions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      features: (json['features'] as List<dynamic>?)
          ?.map((e) => Feature.fromJson(e as Map<String, dynamic>))
          .toList(),
      visits: (json['visits'] as List<dynamic>?)
          ?.map((e) => Visits.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..id = json['id'] as String?;

Map<String, dynamic> _$SoftwareProductToJson(SoftwareProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'vendor': instance.vendor,
      'rating': instance.rating,
      'review': instance.review,
      'projectStage': instance.projectStage,
      'professions': instance.professions,
      'sectors': instance.sectors,
      'features': instance.features,
      'visits': instance.visits,
    };
