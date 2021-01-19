import 'package:flutter/foundation.dart';

class AppDrawerState with ChangeNotifier {
  int _selectedDrawer = 0;
  int get getSelectedDrawer => _selectedDrawer;

  void setSelectedDrawer(int drawer) {
    _selectedDrawer = drawer;
    notifyListeners();
  }
}