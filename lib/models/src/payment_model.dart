import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_model.freezed.dart';
part 'payment_model.g.dart';

@freezed
class PaymentModel with _$PaymentModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory PaymentModel({
    required int id,
    required String amount,
    required String paymentMethod,
    required int status,
    String? createdAt,
    String? updatedAt,
  }) = _PaymentModel;

  factory PaymentModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentModelFromJson(json);
}
