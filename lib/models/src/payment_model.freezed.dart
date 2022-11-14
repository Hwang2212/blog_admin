// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'payment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaymentModel _$PaymentModelFromJson(Map<String, dynamic> json) {
  return _PaymentModel.fromJson(json);
}

/// @nodoc
mixin _$PaymentModel {
  int get id => throw _privateConstructorUsedError;
  String get amount => throw _privateConstructorUsedError;
  String get paymentMethod => throw _privateConstructorUsedError;
  int get status => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentModelCopyWith<PaymentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentModelCopyWith<$Res> {
  factory $PaymentModelCopyWith(
          PaymentModel value, $Res Function(PaymentModel) then) =
      _$PaymentModelCopyWithImpl<$Res, PaymentModel>;
  @useResult
  $Res call(
      {int id,
      String amount,
      String paymentMethod,
      int status,
      String? createdAt,
      String? updatedAt});
}

/// @nodoc
class _$PaymentModelCopyWithImpl<$Res, $Val extends PaymentModel>
    implements $PaymentModelCopyWith<$Res> {
  _$PaymentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
    Object? paymentMethod = null,
    Object? status = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PaymentModelCopyWith<$Res>
    implements $PaymentModelCopyWith<$Res> {
  factory _$$_PaymentModelCopyWith(
          _$_PaymentModel value, $Res Function(_$_PaymentModel) then) =
      __$$_PaymentModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String amount,
      String paymentMethod,
      int status,
      String? createdAt,
      String? updatedAt});
}

/// @nodoc
class __$$_PaymentModelCopyWithImpl<$Res>
    extends _$PaymentModelCopyWithImpl<$Res, _$_PaymentModel>
    implements _$$_PaymentModelCopyWith<$Res> {
  __$$_PaymentModelCopyWithImpl(
      _$_PaymentModel _value, $Res Function(_$_PaymentModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
    Object? paymentMethod = null,
    Object? status = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_PaymentModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_PaymentModel implements _PaymentModel {
  const _$_PaymentModel(
      {required this.id,
      required this.amount,
      required this.paymentMethod,
      required this.status,
      this.createdAt,
      this.updatedAt});

  factory _$_PaymentModel.fromJson(Map<String, dynamic> json) =>
      _$$_PaymentModelFromJson(json);

  @override
  final int id;
  @override
  final String amount;
  @override
  final String paymentMethod;
  @override
  final int status;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;

  @override
  String toString() {
    return 'PaymentModel(id: $id, amount: $amount, paymentMethod: $paymentMethod, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaymentModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, amount, paymentMethod, status, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaymentModelCopyWith<_$_PaymentModel> get copyWith =>
      __$$_PaymentModelCopyWithImpl<_$_PaymentModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaymentModelToJson(
      this,
    );
  }
}

abstract class _PaymentModel implements PaymentModel {
  const factory _PaymentModel(
      {required final int id,
      required final String amount,
      required final String paymentMethod,
      required final int status,
      final String? createdAt,
      final String? updatedAt}) = _$_PaymentModel;

  factory _PaymentModel.fromJson(Map<String, dynamic> json) =
      _$_PaymentModel.fromJson;

  @override
  int get id;
  @override
  String get amount;
  @override
  String get paymentMethod;
  @override
  int get status;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_PaymentModelCopyWith<_$_PaymentModel> get copyWith =>
      throw _privateConstructorUsedError;
}
