import 'package:bein_mobile/models/feature/feature.dart';
import 'package:bein_mobile/models/sector_product/sector_product.dart';
import 'package:bein_mobile/models/visits/visits.dart';
import 'package:json_annotation/json_annotation.dart';

part 'software_product.g.dart';

@JsonSerializable()
class SoftwareProduct {
  @JsonKey(name: 'id')
  String? id = "";

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'vendor')
  String? vendor;

  @JsonKey(name: 'rating')
  int? rating;

  @JsonKey(name: 'review')
  String? review;

  @JsonKey(name: 'projectStage')
  String? projectStage;

  @JsonKey(name: 'professions')
  List<String>? professions;

  //NP
  @JsonKey(name: 'sectors')
  List<SectorProduct>? sectors;

  @JsonKey(name: 'features')
  List<Feature>? features;

  @JsonKey(name: 'visits')
  List<Visits>? visits;

  SoftwareProduct({
    this.name,
    this.description,
    this.vendor,
    this.rating,
    this.review,
    this.sectors,
    this.projectStage,
    this.professions,
    this.features,
    this.visits,
  });

  factory SoftwareProduct.fromJson(Map<String, dynamic> json) =>
      _$SoftwareProductFromJson(json);

  Map<String, dynamic> toJson() => _$SoftwareProductToJson(this);
}
