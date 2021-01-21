import 'dart:ui';

import 'package:flutter_case_study/domain/entities/category.dart';
import 'package:flutter_case_study/domain/entities/product.dart';
import 'package:flutter_case_study/domain/repositories/products_repository.dart';

class DataProductsRepository extends ProductsRepository {

  List<Product> products ;

  // sigleton
  static final DataProductsRepository _instance = DataProductsRepository._internal();
  DataProductsRepository._internal() {
    products = <Product>[];
    products.addAll([
      Product("uid-1", "Amazing Offer","Office Bag", "Product Description goes here", 2000, 35, Color(0xFF3D82AE),"assets/images/bag_1.png", 'cat-uid-1'),
      Product("uid-2", "Aristocratic HandBag", "Belt Bag", "Product Description goes here", 1900, 20, Color(0xFFD3A984),"assets/images/bag_2.png", 'cat-uid-1'),
      Product("uid-3", "What a bug!", "Hang Top", "Product Description goes here", 3200, 25, Color(0xFF989493),"assets/images/bag_3.png", 'cat-uid-1'),
      Product("uid-4", "For modern people", "Old Fashion", "Product Description goes here", 1360, 20, Color(0xFFE6B398),"assets/images/bag_4.png", 'cat-uid-1'),
      Product("uid-5", "70% off!", "Office Code", "Product Description goes here", 1999, 35, Color(0xFFFB7883),"assets/images/bag_5.png", 'cat-uid-1'),
      Product("uid-6", "You have to have this!", "Office", "Product Description goes here", 9999, 40, Color(0xFFAEAEAE),"assets/images/bag_6.png", 'cat-uid-1'),
      Product("uid-7", "Little Black Dress", "Black Dress", "Product Description goes here,Product Description goes here,Product Description goes here,Product Description goes here,Product Description goes here,Product Description goes here,Product Description goes here,Product Description goes here,Product Description goes here,Product Description goes here,Product Description goes here,Product Description goes here,Product Description goes here,Product Description goes here,Product Description goes here,Product Description goes here,Product Description goes here,Product Description goes here,Product Description goes here,Product Description goes here,Product Description goes here,Product Description goes here", 19999, 50, Color(0xFF989493),"assets/images/dress_1.png", 'cat-uid-2')
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
  Future<List<Product>> getProductsWithCategory(Category category) async {
    //emulate some response time
    await Future.delayed(Duration(seconds: 1));

    return products.where((element) => element.categoryUid == category.uid).toList() ;
  }

  @override
  Future<Product> getProduct(String uid) async {
    // Here, do some heavy work lke http requests, async tasks, etc to get data

    return products.firstWhere((category) => category.uid == uid) ;
  }

}