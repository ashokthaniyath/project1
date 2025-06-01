import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  bool _isLoading = false;
  int _currentIndex = 0;

  bool get isLoading => _isLoading;
  int get currentIndex => _currentIndex;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}