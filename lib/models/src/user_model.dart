import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

enum MemberStatus {

  @JsonValue(1)
  normal,
  @JsonValue(2)
  premium,


}

@freezed
class UserModel with _$UserModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory UserModel(
      {required int id,
      required String fullName,
      required String username,
      required String password,
      String? email,
      String? createdAt,
      String? updatedAt,
      required MemberStatus membership}) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
