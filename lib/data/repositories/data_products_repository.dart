import 'dart:ui';

import 'package:flutter_case_study/domain/entities/product.dart';
import 'package:flutter_case_study/domain/repositories/products_repository.dart';

class DataProductsRepository extends ProductsRepository {

  List<Product> products ;

  // sigleton
  static final DataProductsRepository _instance = DataProductsRepository._internal();
  DataProductsRepository._internal() {
    products = <Product>[];
    products.addAll([
      Product("uid-1", "Office Bag", "Product Description goes here", 2000, 3, Color(0xFF3D82AE),"assets/images/bag_1.png"),
      Product("uid-2", "Belt Bag", "Product Description goes here", 1900, 2, Color(0xFFD3A984),"assets/images/bag_2.png"),
      Product("uid-3", "Hang Top", "Product Description goes here", 3200, 2, Color(0xFF989493),"assets/images/bag_3.png"),
      Product("uid-4", "Old Fashion", "Product Description goes here", 1360, 4, Color(0xFFE6B398),"assets/images/bag_4.png"),
      Product("uid-5", "Office Code", "Product Description goes here", 1999, 5, Color(0xFFFB7883),"assets/images/bag_5.png"),
      Product("uid-6", "Office", "Product Description goes here", 9999, 1, Color(0xFFAEAEAE),"assets/images/bag_6.png")
    ]);
  }
  factory DataProductsRepository() => _instance;


  @override
  Future<List<Product>> getProducts() async {
    // Here, do some heavy work lke http requests, async tasks, etc to get data

    //emulate some response time
    await Future.delayed(Duration(seconds: 1));

    return products ;
  }

  @override
  Future<Product> getProduct(String uid) async {
    // Here, do some heavy work lke http requests, async tasks, etc to get data

    return products.firstWhere((category) => category.uid == uid);
  }
}