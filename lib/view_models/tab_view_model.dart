import 'package:flutter/material.dart';

class TabViewModel extends ChangeNotifier {
  int activPageIndex = 0;

  void ChangePageIndex(int newIndex){
    activPageIndex = newIndex;
    notifyListeners();
  }
}