// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$PostModelToJson(PostModel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'userId': instance.userId,
      'category_id': instance.categoryId,
      'status': instance.status,
      'label': _$MemberStatusEnumMap[instance.label],
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

const _$MemberStatusEnumMap = {
  MemberStatus.normal: 1,
  MemberStatus.premium: 2,
};

_$_PostModel _$$_PostModelFromJson(Map<String, dynamic> json) => _$_PostModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      body: json['body'] as String?,
      userId: json['userId'] as int?,
      categoryId: json['categoryId'] as int?,
      status: json['status'] as String?,
      label: $enumDecodeNullable(_$MemberStatusEnumMap, json['label']),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$_PostModelToJson(_$_PostModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'userId': instance.userId,
      'categoryId': instance.categoryId,
      'status': instance.status,
      'label': _$MemberStatusEnumMap[instance.label],
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
