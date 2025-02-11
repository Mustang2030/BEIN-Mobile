// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sector_principle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SectorPrinciple _$SectorPrincipleFromJson(Map<String, dynamic> json) =>
    SectorPrinciple(
      principle: json['principle'] as String?,
      description: json['description'] as String?,
      sectorInformation: json['sectorInformation'] == null
          ? null
          : SectorInformation.fromJson(
              json['sectorInformation'] as Map<String, dynamic>),
    )
      ..id = json['id'] as String?
      ..sectorInformationId = json['sectorInformationId'] as String?;

Map<String, dynamic> _$SectorPrincipleToJson(SectorPrinciple instance) =>
    <String, dynamic>{
      'id': instance.id,
      'principle': instance.principle,
      'description': instance.description,
      'sectorInformationId': instance.sectorInformationId,
      'sectorInformation': instance.sectorInformation,
    };
