import 'package:flutter/material.dart';
import 'package:flutter_case_study/domain/entities/category.dart';

import 'drawer/app_drawer.dart';

class ScaffoldWithDrawer extends StatelessWidget {
  ScaffoldWithDrawer(
      {Key key, this.title, this.body, this.showBackInsteadOfDrawer = false, this.withCategoryHero})
      : super(key: key);

  final String title;
  final Widget body;

  final bool showBackInsteadOfDrawer;

  final Category withCategoryHero;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          leading: showBackInsteadOfDrawer ? IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ) : null,
        ),
        body: body,
        drawer: AppDrawer(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        floatingActionButton: withCategoryHero == null? null : FloatingActionButton(
          backgroundColor: Colors.white,
          foregroundColor: Colors.white,
          heroTag: null,
          child: Hero(
            tag: withCategoryHero.uid,
            child: Image.asset(
              withCategoryHero.image,
              fit: BoxFit.fill,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        )
    );
  }
}