import 'package:bein_mobile/models/sector/sector.dart';
import 'package:bein_mobile/models/software_product/software_product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sector_product.g.dart';

@JsonSerializable()
class SectorProduct {
  @JsonKey(name: 'productId')
  String? productId = "";

  @JsonKey(name: 'productName')
  String? productName;

  @JsonKey(name: 'product')
  SoftwareProduct? product;

  //Key
  @JsonKey(name: 'sectorId')
  String? sectorId = "";

  @JsonKey(name: 'sectorTitle')
  String? sectorTitle;

  @JsonKey(name: 'sector')
  Sector? sector;

  SectorProduct({
    this.productName,
    this.product,
    this.sectorTitle,
    this.sector,
  });

  factory SectorProduct.fromJson(Map<String, dynamic> json) =>
      _$SectorProductFromJson(json);

  Map<String, dynamic> toJson() => _$SectorProductToJson(this);
}
