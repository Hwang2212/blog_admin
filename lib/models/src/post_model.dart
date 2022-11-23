import 'package:Blog_web/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_model.freezed.dart';
part 'post_model.g.dart';

@freezed
@JsonSerializable(fieldRename: FieldRename.snake)
class PostModel with _$PostModel {
  const factory PostModel({
    int? id,
    String? title,
    String? body,
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
