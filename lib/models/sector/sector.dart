import 'package:bein_mobile/models/sector_information/sector_information.dart';
import 'package:bein_mobile/models/sector_product/sector_product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sector.g.dart';

@JsonSerializable()
class Sector {
  @JsonKey(name: 'id')
  String? id = "";

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'description')
  String? description;

  //Navigation Properties
  @JsonKey(name: 'products')
  List<SectorProduct>? products;

  @JsonKey(name: 'sectorInformation')
  SectorInformation? sectorInformation;

  Sector({
    this.title,
    this.description,
    this.products,
    this.sectorInformation,
  });

  factory Sector.fromJson(Map<String, dynamic> json) => _$SectorFromJson(json);

  Map<String, dynamic> toJson() => _$SectorToJson(this);
}
