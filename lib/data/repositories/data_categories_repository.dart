import 'package:flutter_case_study/domain/entities/category.dart';
import 'package:flutter_case_study/domain/repositories/categories_repository.dart';

class DataCategoriesRepository extends CategoriesRepository {

  List<Category> categories ;

  // sigleton
  static final DataCategoriesRepository _instance = DataCategoriesRepository._internal();
  DataCategoriesRepository._internal() {
    categories = <Category>[];
    categories.addAll([
      Category('uid-1', 'Shoes'),
      Category('uid-2', 'Clothes')
    ]);
  }
  factory DataCategoriesRepository() => _instance;


  @override
  Future<List<Category>> getCategories() async {
    // Here, do some heavy work lke http requests, async tasks, etc to get data

    //emulate some response time
    await Future.delayed(Duration(seconds: 1));

    return categories ;
  }

  @override
  Future<Category> getCategory(String uid) async {
    // Here, do some heavy work lke http requests, async tasks, etc to get data

    return categories.firstWhere((category) => category.uid == uid);
  }
}