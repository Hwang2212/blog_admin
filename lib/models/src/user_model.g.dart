// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      id: json['id'] as int,
      fullName: json['full_name'] as String,
      username: json['username'] as String,
      password: json['password'] as String,
      email: json['email'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      membership: $enumDecode(_$MemberStatusEnumMap, json['membership']),
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'username': instance.username,
      'password': instance.password,
      'email': instance.email,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'membership': _$MemberStatusEnumMap[instance.membership]!,
    };

const _$MemberStatusEnumMap = {
  MemberStatus.normal: 1,
  MemberStatus.premium: 2,
};
