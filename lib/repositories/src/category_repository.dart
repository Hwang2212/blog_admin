import 'dart:developer';

import 'package:Blog_web/models/models.dart';
import 'package:Blog_web/utils/utils.dart';

class CategoryRepository {
  List<CategoryModel> _categoryList = [];
  List<CategoryModel> get categoryList => _categoryList;

  List<CategoryModel> getCategoryList() {
    List<CategoryModel> categoryData = StagingCategory.categoryList;
    if (categoryData.every((element) => categoryList.contains(element))) {
      return categoryList;
    } else {
      _categoryList.addAll(categoryData);
      return categoryList;
    }
  }

  Future<void> addCategory({required CategoryModel newCategory}) async {
    try {
      _categoryList.add(newCategory);
      log("Category Added $newCategory");
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> removeCategory({required CategoryModel category}) async {
    try {
      _categoryList.remove(category);
      log("Category Removed $category");
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
