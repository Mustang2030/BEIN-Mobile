import 'package:bein_mobile/models/card_info/card_info.dart';
import 'package:bein_mobile/models/sector/sector.dart';
import 'package:bein_mobile/models/sector_principle/sector_principle.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sector_information.g.dart';

@JsonSerializable()
class SectorInformation {
  @JsonKey(name: 'id')
  String? id = "";

  @JsonKey(name: 'header')
  String? header;

  //Fk
  @JsonKey(name: 'sectorId')
  String? sectorId = "";

  //NP
  @JsonKey(name: 'sector')
  Sector? sector;

  @JsonKey(name: 'cardInformation')
  List<CardInfo>? cardInformation;

  @JsonKey(name: 'sectorPrinciples')
  List<SectorPrinciple>? sectorPrinciples;

  SectorInformation({
    this.header,
    this.sector,
    this.cardInformation,
    this.sectorPrinciples,
  });

  factory SectorInformation.fromJson(Map<String, dynamic> json) =>
      _$SectorInformationFromJson(json);

  Map<String, dynamic> toJson() => _$SectorInformationToJson(this);
}
