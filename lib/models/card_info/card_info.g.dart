// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardInfo _$CardInfoFromJson(Map<String, dynamic> json) => CardInfo(
      header: json['header'] as String?,
      information: json['information'] as String?,
      sectorInformation: json['sectorInformation'] == null
          ? null
          : SectorInformation.fromJson(
              json['sectorInformation'] as Map<String, dynamic>),
    )
      ..id = json['id'] as String?
      ..sectorInformationId = json['sectorInformationId'] as String?;

Map<String, dynamic> _$CardInfoToJson(CardInfo instance) => <String, dynamic>{
      'id': instance.id,
      'header': instance.header,
      'information': instance.information,
      'sectorInformationId': instance.sectorInformationId,
      'sectorInformation': instance.sectorInformation,
    };
