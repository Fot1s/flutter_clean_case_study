import 'package:flutter/material.dart';
import 'package:flutter_case_study/domain/entities/category.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import 'categories_presenter.dart';

class CategoriesController extends Controller {

  List<Category> _categories ;

  List<Category> get categories => _categories ;

  final CategoriesPresenter categoriesPresenter ;

  CategoriesController(categoriesRepo) : categoriesPresenter = CategoriesPresenter(categoriesRepo), super() {
    getCategories() ;
  }

  @override
  void initListeners() {
    categoriesPresenter.getCategoriesOnNext = (List<Category> categories) {
      print('Categories here (onNext)');

      _categories = categories ;
      refreshUI() ;
    } ;

    categoriesPresenter.getCategoriesOnComplete = () {
      print('getCategoriesOnComplete');
    } ;

    categoriesPresenter.getCategoriesOnError = (e) {

        print('Could not retrieve categories.');
        ScaffoldState state = getState();
        state.showSnackBar(SnackBar(content: Text(e.message)));

        refreshUI(); // Refreshes the UI manually
    } ;

  }

  void getCategories() => categoriesPresenter.getCategories() ;

  @override
  void onResumed() => print('On resumed');

  @override
  void onReassembled() => print('View is about to be reassembled');

  @override
  void onDeactivated() => print('View is about to be deactivated');

  @override
  void onDisposed() {
    categoriesPresenter.dispose(); // don't forget to dispose of the presenter
    super.onDisposed();
  }
}