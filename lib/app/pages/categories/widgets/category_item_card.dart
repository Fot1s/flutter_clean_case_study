import 'package:flutter/material.dart';
import 'package:flutter_case_study/app/utils.dart';
import 'package:flutter_case_study/domain/entities/category.dart';

import '../../../constants.dart';

class CategoryItemCard extends StatelessWidget {
  final Category category;
  final Function press;
  const CategoryItemCard({
    Key key,
    this.category,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(kDefaultPaddin),
              child: Hero(
                tag: category.uid,
                child: Image.asset(category.image),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
            child: Text(
              category.title,
              style: TextStyle(color: kTextLightColor),
            ),
          ),
        ],
      ),
    );
  }
}