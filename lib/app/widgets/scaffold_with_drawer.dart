import 'package:flutter/material.dart';

import 'drawer/app_drawer.dart';

class ScaffoldWithDrawer extends StatelessWidget
{
  ScaffoldWithDrawer({Key key, this.title, this.body}) : super(key: key);

  final String title;
  final Widget body ;

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: body,
      drawer: AppDrawer(),
    );
  }
}