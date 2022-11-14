import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
class CategoryModel with _$CategoryModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory CategoryModel({
    required int id,
    required String name,
    required String description,
    required int activated,
    String? createdAt,
    String? updatedAt,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}
