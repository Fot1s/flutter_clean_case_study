
import 'package:flutter_case_study/domain/entities/category.dart';

abstract class CategoriesRepository {
  Future<Category> getCategory(String uid);
  Future<List<Category>> getCategories();
}
