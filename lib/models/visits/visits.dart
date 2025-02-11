import 'package:bein_mobile/models/software_product/software_product.dart';
import 'package:bein_mobile/models/user/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'visits.g.dart';

@JsonSerializable()
class Visits {
  //key
  @JsonKey(name: 'userId')
  String? userId = "";

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'surname')
  String? surname;

  @JsonKey(name: 'user')
  User? user;

  //key
  String? softwareProductId = "";
  String? productName;
  SoftwareProduct? product;

  Visits({
    this.userId,
    this.name,
    this.surname,
    this.user,
    this.softwareProductId,
    this.productName,
    this.product,
  });

  factory Visits.fromJson(Map<String, dynamic> json) => _$VisitsFromJson(json);

  Map<String, dynamic> toJson() => _$VisitsToJson(this);
}
