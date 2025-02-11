import 'package:json_annotation/json_annotation.dart';

part 'registration.g.dart';

@JsonSerializable()
class Registration {
  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "surname")
  String? surname;

  @JsonKey(name: "email")
  String? email;

  @JsonKey(name: "password")
  String? password;

  Registration({
    this.name,
    this.surname,
    this.email,
    this.password,
  });

  factory Registration.fromJson(Map<String, dynamic> json) =>
      _$RegistrationFromJson(json);

  Map<String, dynamic> toJson() => _$RegistrationToJson(this);
}
