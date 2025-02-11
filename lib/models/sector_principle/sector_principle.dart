import 'package:bein_mobile/models/sector_information/sector_information.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sector_principle.g.dart';

@JsonSerializable()
class SectorPrinciple {
  @JsonKey(name: 'id')
  String? id = "";

  @JsonKey(name: 'principle')
  String? principle;

  @JsonKey(name: 'description')
  String? description;

  //Fk
  @JsonKey(name: 'sectorInformationId')
  String? sectorInformationId = "";

  //Np
  @JsonKey(name: 'sectorInformation')
  SectorInformation? sectorInformation;

  SectorPrinciple({
    this.principle,
    this.description,
    this.sectorInformation,
  });

  factory SectorPrinciple.fromJson(Map<String, dynamic> json) =>
      _$SectorPrincipleFromJson(json);

  Map<String, dynamic> toJson() => _$SectorPrincipleToJson(this);
}
