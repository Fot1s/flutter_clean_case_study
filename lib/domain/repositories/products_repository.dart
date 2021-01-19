
import 'package:flutter_case_study/domain/entities/product.dart';

abstract class ProductsRepository {
  Future<Product> getProduct(String uid);
  Future<List<Product>> getProducts();
}
