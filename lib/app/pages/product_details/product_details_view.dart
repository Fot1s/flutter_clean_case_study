import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_case_study/app/pages/product_details/widgets/color_and_size.dart';
import 'package:flutter_case_study/app/pages/product_details/widgets/description.dart';
import 'package:flutter_case_study/app/pages/product_details/widgets/product_title_with_image.dart';
import 'package:flutter_case_study/domain/entities/product.dart';

import '../../constants.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  const ProductDetailsScreen({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // each product have a color
      backgroundColor: product.color,
      appBar: buildAppBar(context),
      body: buildBody(context, product),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: product.color,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }

  Widget buildBody(BuildContext context, Product product) {
    return OrientationBuilder(builder: (context, orientation) {
      if (orientation == Orientation.portrait) {
        return buildPortraitView(context);
      } else {
        return buildLandscapeView(context);
      }
    });
  }

  Widget buildLandscapeView(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            child: ProductTitleWithImage(
          product: product,
          forPortraitMode: false,
        )),
        Expanded(
             child: //SingleChildScrollView(
            //     child:
                Container(
          margin: EdgeInsets.only(top: kDefaultPaddin),
          padding: EdgeInsets.only(
            top: kDefaultPaddin,
            left: kDefaultPaddin,
            right: kDefaultPaddin,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          child: SingleChildScrollView( child: Column(
            children: <Widget>[
              ColorAndSize(product: product),
              SizedBox(height: kDefaultPaddin / 2),
              Description(product: product),
              SizedBox(height: kDefaultPaddin / 2),
              // CounterWithFavBtn(),
              // SizedBox(height: kDefaultPaddin / 2),
              // AddToCart(product: product)
            ],
          )),
        )),//),
      ],
    );
  }

  Widget buildPortraitView(BuildContext context) {
    // It provide us total height and width
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                    top: size.height * 0.12,
                    left: kDefaultPaddin,
                    right: kDefaultPaddin,
                  ),
                  // height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      ColorAndSize(product: product),
                      SizedBox(height: kDefaultPaddin / 2),
                      Description(product: product),
                      SizedBox(height: kDefaultPaddin / 2),
                      // CounterWithFavBtn(),
                      // SizedBox(height: kDefaultPaddin / 2),
                      // AddToCart(product: product)
                    ],
                  ),
                ),
                ProductTitleWithImage(product: product, forPortraitMode: true)
              ],
            ),
          )
        ],
      ),
    );
  }
}
