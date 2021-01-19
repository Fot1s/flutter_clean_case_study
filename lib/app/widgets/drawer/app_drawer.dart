import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_case_study/app/pages/categories/categories_view.dart';
import 'package:flutter_case_study/app/pages/products/products_view.dart';
import 'package:flutter_case_study/main.dart';
import 'package:provider/provider.dart';

import 'app_drawer_state.dart';

class AppDrawer extends StatelessWidget
{

  @override
  Widget build (BuildContext context) {
    var selectedDrawer = Provider.of<AppDrawerState>(context).getSelectedDrawer ;

    return Drawer(
          child: new ListView(
            children: <Widget>[
              _createHeader(),
            Divider(height: 1,),
            _createDrawerItem(drawerId: 0, selectedDrawer: selectedDrawer, icon: Icons.home,text: 'Home',onTap:(){ _onDrawerTapped(context,0,selectedDrawer);}),
            Divider(height: 1,),
            _createDrawerItem(drawerId: 1, selectedDrawer: selectedDrawer, icon: Icons.contacts,text: 'Categories',onTap:(){ _onDrawerTapped(context,1,selectedDrawer);}),
            Divider(height: 1,),
            _createDrawerItem(drawerId: 2, selectedDrawer: selectedDrawer, icon: Icons.star,text: 'Products',onTap:(){_onDrawerTapped(context,2,selectedDrawer);}),
            Divider(height: 1,),
            ],
          )
    );
  }

  Widget _createHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            // image: DecorationImage(
            //     fit: BoxFit.fill,
            //     image:  AssetImage('assets/images/phone-wings.png'))
        ),
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text("User here?",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500))),
        ]));
  }

  Widget _createDrawerItem(
      {int drawerId, int selectedDrawer, IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text, style: TextStyle(fontWeight: drawerId == selectedDrawer? FontWeight.w700 : FontWeight.normal),),
          )
        ],
      ),
      onTap: onTap,
    );
  }


  void _onDrawerTapped(BuildContext context, int thisIndex, int selectedIndex)
  {
    Navigator.pop(context);

    if (thisIndex != selectedIndex) {

      PageRoute route ;

      switch (thisIndex) {
        case 0:
          route = CupertinoPageRoute(builder: (context) => MyHomePage()) ;
          break ;
        case 1:
          route = CupertinoPageRoute(builder: (context) => CategoriesPage()) ;
          break ;
        case 2:
          route = CupertinoPageRoute(builder: (context) => ProductsPage()) ;
          break ;
        default :
          Scaffold.of(context).showSnackBar(SnackBar(duration: Duration(seconds: 2),
            content: Text("Drawer Item Missing implementation! Please fix!"),
          ));

          print("Drawer Item Missing implementation! Please fix!") ;
          return ;
      }

      Provider.of<AppDrawerState>(context, listen: false).setSelectedDrawer(thisIndex);

      Navigator.push(
        context,
        route,
      );
    }
  }
}