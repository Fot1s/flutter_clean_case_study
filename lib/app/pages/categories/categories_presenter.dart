import 'package:flutter_case_study/domain/usecases/get_categories_usecase.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class CategoriesPresenter extends Presenter{

  Function getCategoriesOnNext;
  Function getCategoriesOnComplete;
  Function getCategoriesOnError;

  final GetCategoriesUseCase getCategoriesUseCase ;

  CategoriesPresenter(categoriesRepo) : getCategoriesUseCase = GetCategoriesUseCase(categoriesRepo);

  void getCategories() {
    getCategoriesUseCase.execute(
        _GetCategoriesUseCaseObserver(this), GetCategoriesUseCaseParams("test"));
  }

  @override
  void dispose() {
    getCategoriesUseCase.dispose();
  }

}


class _GetCategoriesUseCaseObserver extends Observer<GetCategoriesUseCaseResponse> {
  final CategoriesPresenter presenter;
  _GetCategoriesUseCaseObserver(this.presenter);

  @override
  void onComplete() {
    assert(presenter.getCategoriesOnComplete != null);
    presenter.getCategoriesOnComplete();
  }

  @override
  void onError(e) {
    assert(presenter.getCategoriesOnError != null);
    presenter.getCategoriesOnError(e);
  }

  @override
  void onNext(response) {
    assert(presenter.getCategoriesOnNext != null);
    presenter.getCategoriesOnNext(response.categories);
  }
}
