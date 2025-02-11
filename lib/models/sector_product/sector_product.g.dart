// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sector_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SectorProduct _$SectorProductFromJson(Map<String, dynamic> json) =>
    SectorProduct(
      productName: json['productName'] as String?,
      product: json['product'] == null
          ? null
          : SoftwareProduct.fromJson(json['product'] as Map<String, dynamic>),
      sectorTitle: json['sectorTitle'] as String?,
      sector: json['sector'] == null
          ? null
          : Sector.fromJson(json['sector'] as Map<String, dynamic>),
    )
      ..productId = json['productId'] as String?
      ..sectorId = json['sectorId'] as String?;

Map<String, dynamic> _$SectorProductToJson(SectorProduct instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'productName': instance.productName,
      'product': instance.product,
      'sectorId': instance.sectorId,
      'sectorTitle': instance.sectorTitle,
      'sector': instance.sector,
    };
