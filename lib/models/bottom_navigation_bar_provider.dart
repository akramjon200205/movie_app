import 'package:flutter/cupertino.dart';

class BottomNavigationBarProvider extends ChangeNotifier {
  int? currentIndex;  

  void updatePage() {
    notifyListeners();
  }
}
