import 'package:flutter/material.dart';
import 'package:flutter_case_study/app/pages/product_details/product_details_view.dart';

import 'package:flutter_case_study/app/pages/products/products_controller.dart';
import 'package:flutter_case_study/app/pages/products/widgets/product_item_card.dart';
import 'package:flutter_case_study/app/widgets/scaffold_with_drawer.dart';
import 'package:flutter_case_study/data/repositories/data_products_repository.dart';
import 'package:flutter_case_study/domain/entities/product.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../constants.dart';

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
        return controller.products != null ? buildProducts(controller.products) : buildLoader() ;
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

  buildProducts(List<Product> products) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        //TODO: Next version add categories here
        // Categories(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(kDefaultPaddin,kDefaultPaddin,kDefaultPaddin,0),
            child: GridView.builder(
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: kDefaultPaddin,
                  crossAxisSpacing: kDefaultPaddin,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) => ProductItemCard(
                  product: products[index],
                  press: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailsScreen(
                          product: products[index],
                        ),
                      )),
                )),
          ),
        ),
      ],
    );
  }
}