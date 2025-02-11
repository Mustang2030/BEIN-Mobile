import 'package:json_annotation/json_annotation.dart';

part 'sign_in.g.dart';

@JsonSerializable()
class SignIn {
  @JsonKey(name: 'email')
  String? email;

  @JsonKey(name: 'password')
  String? password;

  SignIn({
    this.email,
    this.password,
  });

  factory SignIn.fromJson(Map<String, dynamic> json) => _$SignInFromJson(json);

  Map<String, dynamic> toJson() => _$SignInToJson(this);
}
