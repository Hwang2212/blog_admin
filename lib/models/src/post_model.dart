import 'package:Blog_web/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_model.freezed.dart';
part 'post_model.g.dart';

@freezed
class PostModel with _$PostModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory PostModel({
    required int id,
    required String title,
    required String body,
    @JsonKey(name: 'userId') int? userId,
    int? categoryId,
    String? status,
    MemberStatus? label,
    String? createdAt,
    String? updatedAt,
  }) = _PostModel;

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);
}
