// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sector.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sector _$SectorFromJson(Map<String, dynamic> json) => Sector(
      title: json['title'] as String?,
      description: json['description'] as String?,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => SectorProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
      sectorInformation: json['sectorInformation'] == null
          ? null
          : SectorInformation.fromJson(
              json['sectorInformation'] as Map<String, dynamic>),
    )..id = json['id'] as String?;

Map<String, dynamic> _$SectorToJson(Sector instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'products': instance.products,
      'sectorInformation': instance.sectorInformation,
    };
