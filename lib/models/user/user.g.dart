// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      name: json['name'] as String?,
      surname: json['surname'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      profession: json['profession'] as String?,
      yearsOfExperience: (json['yearsOfExperience'] as num?)?.toInt(),
      visits: (json['visits'] as List<dynamic>?)
          ?.map((e) => Visits.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..id = json['id'] as String?;

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'surname': instance.surname,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'profession': instance.profession,
      'yearsOfExperience': instance.yearsOfExperience,
      'visits': instance.visits,
    };
