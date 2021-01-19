import 'package:flutter/material.dart';
import 'package:flutter_case_study/app/pages/products/products_controller.dart';
import 'package:flutter_case_study/app/widgets/scaffold_with_drawer.dart';
import 'package:flutter_case_study/data/repositories/data_products_repository.dart';
import 'package:flutter_case_study/domain/entities/product.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class ProductsPage extends View {

  ProductsPage({Key key}) : super(key: key);

  final String title = "Products Page";

  @override
  _ProductsPagePageState createState() =>
      // inject dependencies inwards
  _ProductsPagePageState();
}

class _ProductsPagePageState
    extends ViewState<ProductsPage, ProductsController> {
  _ProductsPagePageState()
      : super(ProductsController(DataProductsRepository()));

  @override
  Widget get view {
    // built in global key for the ViewState for easy access in the controller
    return ScaffoldWithDrawer(
      key: globalKey, title: widget.title, body: addBody(),);
  }

  Widget addBody() {
    return ControlledWidgetBuilder<ProductsController>(
      builder: (context, controller) {
        return controller.products != null ? buildCategories(controller.products) : buildLoader() ;
      },
    ) ;
  }

  buildLoader() {
    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator()
            ]
        ));
  }

  buildCategories(List<Product> products) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('${products[index].title}'),
        );
      },
    );
  }
}