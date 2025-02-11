import 'package:bein_mobile/models/visits/visits.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: 'id')
  String? id = "";

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'surname')
  String? surname;

  @JsonKey(name: 'email')
  String? email;

  @JsonKey(name: 'phoneNumber')
  String? phoneNumber;

  @JsonKey(name: 'profession')
  String? profession;

  @JsonKey(name: 'yearsOfExperience')
  int? yearsOfExperience;

  @JsonKey(name: 'visits')
  List<Visits>? visits;

  User({
    this.name,
    this.surname,
    this.email,
    this.phoneNumber,
    this.profession,
    this.yearsOfExperience,
    this.visits,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
