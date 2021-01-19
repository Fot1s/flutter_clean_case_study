import 'package:flutter_case_study/domain/entities/category.dart';
import 'package:flutter_case_study/domain/usecases/get_products_usecase.dart';
import 'package:flutter_case_study/domain/usecases/get_products_with_category_usecase.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class ProductsPresenter extends Presenter{

  Function getProductsOnNext;
  Function getProductsOnComplete;
  Function getProductsOnError;

  final GetProductsUseCase getProductsUseCase ;
  final GetProductsWithCategoryUseCase getProductsWithCategoryUseCase ;

  ProductsPresenter(productsRepo) :
        getProductsUseCase = GetProductsUseCase(productsRepo),
        getProductsWithCategoryUseCase = GetProductsWithCategoryUseCase(productsRepo) ;

  void getProducts() {
    getProductsUseCase.execute(
        _GetProductsUseCaseObserver(this));
  }

  void getProductsWithCategory(Category category) {
    getProductsWithCategoryUseCase.execute(
        _GetProductsUseCaseObserver(this), GetProductsUseCaseParams(category));
  }

  @override
  void dispose() {
    getProductsUseCase.dispose();
    getProductsWithCategoryUseCase.dispose() ;
  }

}

class _GetProductsUseCaseObserver extends Observer<GetProductsUseCaseResponse> {
  final ProductsPresenter presenter;
  _GetProductsUseCaseObserver(this.presenter);

  @override
  void onComplete() {
    assert(presenter.getProductsOnComplete != null);
    presenter.getProductsOnComplete();
  }

  @override
  void onError(e) {
    assert(presenter.getProductsOnError != null);
    presenter.getProductsOnError(e);
  }

  @override
  void onNext(response) {
    assert(presenter.getProductsOnNext != null);
    presenter.getProductsOnNext(response.products);
  }
}
