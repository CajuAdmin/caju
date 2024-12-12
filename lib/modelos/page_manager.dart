import 'package:flutter/cupertino.dart';

class PageManager extends ChangeNotifier {
  
  PageManager(this._pageController);

  final PageController _pageController;
  int _currentPage = 0;

  int get currentPage => _currentPage;

  void setPage(int value){
    _currentPage = value;
    _pageController.jumpToPage(value);
  }

}