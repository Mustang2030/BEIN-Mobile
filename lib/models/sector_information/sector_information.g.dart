// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sector_information.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SectorInformation _$SectorInformationFromJson(Map<String, dynamic> json) =>
    SectorInformation(
      header: json['header'] as String?,
      sector: json['sector'] == null
          ? null
          : Sector.fromJson(json['sector'] as Map<String, dynamic>),
      cardInformation: (json['cardInformation'] as List<dynamic>?)
          ?.map((e) => CardInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      sectorPrinciples: (json['sectorPrinciples'] as List<dynamic>?)
          ?.map((e) => SectorPrinciple.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..id = json['id'] as String?
      ..sectorId = json['sectorId'] as String?;

Map<String, dynamic> _$SectorInformationToJson(SectorInformation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'header': instance.header,
      'sectorId': instance.sectorId,
      'sector': instance.sector,
      'cardInformation': instance.cardInformation,
      'sectorPrinciples': instance.sectorPrinciples,
    };
