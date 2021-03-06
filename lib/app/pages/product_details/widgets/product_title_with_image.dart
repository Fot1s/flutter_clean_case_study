import 'package:flutter/material.dart';
import 'package:flutter_case_study/app/utils.dart';
import 'package:flutter_case_study/domain/entities/product.dart';

import '../../../constants.dart';

class ProductTitleWithImage extends StatelessWidget {
  final forPortraitMode ;
  final Product product;

  const ProductTitleWithImage({
    Key key,
    @required this.product, @required this.forPortraitMode,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            product.superTitle,
            style: TextStyle(color: Colors.white),
          ),
          Text(
            product.title,
            style: Theme.of(context)
                .textTheme
                .headline4
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
//          SizedBox(height: kDefaultPaddin),
          wrapTitlePriceImageWithExpandedInLandscapeMode(context),
        ],
      ),
    );
  }
  
  Widget wrapTitlePriceImageWithExpandedInLandscapeMode(BuildContext context) {
    if (forPortraitMode) {
      return buildTitlePriceImage(context) ;
    } else {
      return Expanded(child: buildTitlePriceImage(context)) ;
      }
  }
  
  Widget buildTitlePriceImage (BuildContext context) {
    return Row(
      children: <Widget>[
        RichText(
          text: TextSpan(
            children: [
              TextSpan(text: "Price\n"),
              TextSpan(
                text: Utils.formatCurrency(product.price),
                style: Theme.of(context).textTheme.headline4.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SizedBox(width: kDefaultPaddin),
        Expanded(
          child: Hero(
            tag: product.uid,
            child: Image.asset(
              product.image,
              fit: BoxFit.fill,
            ),
          ),
        )
      ],
    ) ;
  }
}