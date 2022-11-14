// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PostModel _$$_PostModelFromJson(Map<String, dynamic> json) => _$_PostModel(
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
      categoryId: json['category_id'] as int,
      status: json['status'] as String,
      label: json['label'] as String,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$_PostModelToJson(_$_PostModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'category_id': instance.categoryId,
      'status': instance.status,
      'label': instance.label,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
