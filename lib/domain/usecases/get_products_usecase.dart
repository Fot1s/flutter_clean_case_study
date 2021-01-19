
import 'dart:async';

import 'package:flutter_case_study/domain/entities/product.dart';
import 'package:flutter_case_study/domain/repositories/products_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class GetProductsUseCase extends UseCase<GetProductsUseCaseResponse, void> {

  final ProductsRepository productsRepository;

  GetProductsUseCase(this.productsRepository);

  @override
  Future<Stream<GetProductsUseCaseResponse>> buildUseCaseStream(void ignore) async {

    final controller = StreamController<GetProductsUseCaseResponse>() ;

    try {
      final products = await productsRepository.getProducts() ;
      controller.add(GetProductsUseCaseResponse(products)) ;
      controller.close() ;
    } catch (e) {
      controller.addError(e) ;
    }
    return controller.stream;
  }
}

class GetProductsUseCaseResponse {
  final List<Product> products ;

  GetProductsUseCaseResponse(this.products);
}