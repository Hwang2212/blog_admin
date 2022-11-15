import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:arrivo_web/models/models.dart';

part 'auth_model.freezed.dart';
part 'auth_model.g.dart';

@freezed
class AuthModel with _$AuthModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory AuthModel({
    required UserModel user,
  }) = _AuthModel;

  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);
}
