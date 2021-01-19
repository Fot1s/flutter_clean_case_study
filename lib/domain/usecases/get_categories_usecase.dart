
import 'dart:async';

import 'package:flutter_case_study/domain/entities/category.dart';
import 'package:flutter_case_study/domain/repositories/categories_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class GetCategoriesUseCase extends UseCase<GetCategoriesUseCaseResponse,GetCategoriesUseCaseParams> {

  final CategoriesRepository categoriesRepository;

  GetCategoriesUseCase(this.categoriesRepository);

  @override
  Future<Stream<GetCategoriesUseCaseResponse>> buildUseCaseStream(GetCategoriesUseCaseParams params) async {

    final controller = StreamController<GetCategoriesUseCaseResponse>() ;

    try {
      final categories = await categoriesRepository.getCategories() ;
      controller.add(GetCategoriesUseCaseResponse(categories)) ;
      controller.close() ;
    } catch (e) {
      controller.addError(e) ;
    }
    return controller.stream;
  }
}


class GetCategoriesUseCaseParams {
  // final String uid  ;
  // GetCategoriesUseCaseParams(this.uid);
  GetCategoriesUseCaseParams();
}

class GetCategoriesUseCaseResponse {
  final List<Category> categories ;

  GetCategoriesUseCaseResponse(this.categories);
}