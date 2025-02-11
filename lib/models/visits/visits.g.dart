// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visits.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Visits _$VisitsFromJson(Map<String, dynamic> json) => Visits(
      userId: json['userId'] as String?,
      name: json['name'] as String?,
      surname: json['surname'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      softwareProductId: json['softwareProductId'] as String?,
      productName: json['productName'] as String?,
      product: json['product'] == null
          ? null
          : SoftwareProduct.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VisitsToJson(Visits instance) => <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'surname': instance.surname,
      'user': instance.user,
      'softwareProductId': instance.softwareProductId,
      'productName': instance.productName,
      'product': instance.product,
    };
