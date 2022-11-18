import 'package:arrivo_web/models/models.dart';
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
    required int categoryId,
    required String status,
    required MemberStatus label,
    String? createdAt,
    String? updatedAt,
  }) = _PostModel;

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);
}
