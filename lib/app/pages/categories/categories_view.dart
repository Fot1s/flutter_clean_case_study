import 'package:flutter/material.dart';
import 'package:flutter_case_study/app/pages/categories/categories_controller.dart';
import 'package:flutter_case_study/app/pages/categories/widgets/category_item_card.dart';
import 'package:flutter_case_study/app/pages/products/products_view.dart';
import 'package:flutter_case_study/app/widgets/scaffold_with_drawer.dart';
import 'package:flutter_case_study/data/repositories/data_categories_repository.dart';
import 'package:flutter_case_study/domain/entities/category.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import '../../constants.dart';

class CategoriesPage extends View {

  CategoriesPage({Key key}) : super(key: key);

  final String title = "Categories Page";

  @override
  _CategoriesPageState createState() =>
      // inject dependencies inwards
  _CategoriesPageState();
}

class _CategoriesPageState
    extends ViewState<CategoriesPage, CategoriesController> {
  _CategoriesPageState()
      : super(CategoriesController(DataCategoriesRepository()));

  @override
  Widget get view {
    // built in global key for the ViewState for easy access in the controller
    return ScaffoldWithDrawer(
      key: globalKey, title: widget.title, body: addBody(),);
  }

  Widget addBody() {
    return ControlledWidgetBuilder<CategoriesController>(
      builder: (context, controller) {
        return controller.categories != null ? buildCategories(controller.categories) : buildLoader() ;
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

  buildCategories(List<Category> categories) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        //TODO: Next version add categories here
        // Categories(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(kDefaultPaddin,kDefaultPaddin,kDefaultPaddin,0),
            child: GridView.builder(
                itemCount: categories.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: kDefaultPaddin,
                  crossAxisSpacing: kDefaultPaddin,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) => CategoryItemCard(
                  category: categories[index],
                  press: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductsPage(
                          categories[index],
                        ),
                      )),
                )
            ),
          ),
        ),
      ],
    );
  }
}