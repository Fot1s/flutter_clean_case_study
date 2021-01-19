import 'package:flutter_case_study/domain/usecases/get_products_usecase.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class ProductsPresenter extends Presenter{

  Function getProductsOnNext;
  Function getProductsOnComplete;
  Function getProductsOnError;

  final GetProductsUseCase getProductsUseCase ;

  ProductsPresenter(productsRepo) : getProductsUseCase = GetProductsUseCase(productsRepo);

  void getProducts() {
    getProductsUseCase.execute(
        _GetProductsUseCaseObserver(this));
  }

  @override
  void dispose() {
    getProductsUseCase.dispose();
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
