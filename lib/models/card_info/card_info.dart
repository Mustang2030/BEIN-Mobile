import 'package:bein_mobile/models/sector_information/sector_information.dart';
import 'package:json_annotation/json_annotation.dart';

part 'card_info.g.dart';

@JsonSerializable()
class CardInfo {
  @JsonKey(name: "id")
  String? id = "";

  @JsonKey(name: "header")
  String? header;

  @JsonKey(name: "information")
  String? information;

  //Foreign Key
  @JsonKey(name: "sectorInformationId")
  String? sectorInformationId = "";

  //Navigation Properties
  SectorInformation? sectorInformation;

  CardInfo({
    this.header,
    this.information,
    this.sectorInformation,
  });

  factory CardInfo.fromJson(Map<String, dynamic> json) =>
      _$CardInfoFromJson(json);

  Map<String, dynamic> toJson() => _$CardInfoToJson(this);
}
