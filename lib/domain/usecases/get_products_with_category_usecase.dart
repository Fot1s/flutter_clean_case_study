
import 'dart:async';

import 'package:flutter_case_study/domain/entities/category.dart';
import 'package:flutter_case_study/domain/repositories/products_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import 'get_products_usecase.dart';

class GetProductsWithCategoryUseCase extends UseCase<GetProductsUseCaseResponse, GetProductsUseCaseParams> {

  final ProductsRepository productsRepository;

  GetProductsWithCategoryUseCase(this.productsRepository);

  @override
  Future<Stream<GetProductsUseCaseResponse>> buildUseCaseStream(GetProductsUseCaseParams params) async {

    final controller = StreamController<GetProductsUseCaseResponse>() ;

    try {
      final products = await productsRepository.getProductsWithCategory(params.category) ;
      controller.add(GetProductsUseCaseResponse(products)) ;
      controller.close() ;
    } catch (e) {
      controller.addError(e) ;
    }
    return controller.stream;
  }
}

class GetProductsUseCaseParams{
  final Category category ;

  GetProductsUseCaseParams(this.category);
}
