import 'package:flutter_case_study/domain/entities/category.dart';
import 'package:flutter_case_study/domain/entities/product.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import 'products_presenter.dart';

class ProductsController extends Controller {

  List<Product> _products ;

  List<Product> get products => _products ;

  final ProductsPresenter productsPresenter ;

  ProductsController(productsRepo, category) : productsPresenter = ProductsPresenter(productsRepo), super() {
    if (category != null) {
      getProductsWithCategory(category) ;
    } else {
      getProducts() ;
    }
  }

  @override
  void initListeners() {
    productsPresenter.getProductsOnNext = (List<Product> products) {
      print('Products here (onNext)');

      _products = products ;
      refreshUI() ;
    } ;

    productsPresenter.getProductsOnComplete = () {
      print('getProductsOnComplete');
    } ;

    productsPresenter.getProductsOnError = (e) {

      _products = [] ;
      print('Could not retrieve products.');
        //TODO: FIX: This is buggy!
        // ScaffoldState state = getState();
        // state.showSnackBar(SnackBar(content: Text(e.message)));

        refreshUI(); // Refreshes the UI manually
    } ;

  }

  void getProducts() => productsPresenter.getProducts() ;

  void getProductsWithCategory(Category category) => productsPresenter.getProductsWithCategory(category) ;

  @override
  void onResumed() => print('On resumed');

  @override
  void onReassembled() => print('View is about to be reassembled');

  @override
  void onDeactivated() => print('View is about to be deactivated');

  @override
  void onDisposed() {
    productsPresenter.dispose(); // don't forget to dispose of the presenter
    super.onDisposed();
  }
}