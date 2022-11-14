// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaymentModel _$$_PaymentModelFromJson(Map<String, dynamic> json) =>
    _$_PaymentModel(
      id: json['id'] as int,
      amount: json['amount'] as String,
      paymentMethod: json['payment_method'] as String,
      status: json['status'] as int,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$_PaymentModelToJson(_$_PaymentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'payment_method': instance.paymentMethod,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
