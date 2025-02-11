import 'package:bein_mobile/models/software_product/software_product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'feature.g.dart';

@JsonSerializable()
class Feature {
  @JsonKey(name: 'id')
  String? id = "";

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'softwareProduct')
  SoftwareProduct? softwareProduct;

  @JsonKey(name: 'softwareProductId')
  String? softwareProductId = "";

  Feature({
    this.title,
    this.description,
    this.softwareProduct,
  });

  factory Feature.fromJson(Map<String, dynamic> json) =>
      _$FeatureFromJson(json);

  Map<String, dynamic> toJson() => _$FeatureToJson(this);
}
