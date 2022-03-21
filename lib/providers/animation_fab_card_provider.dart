import 'package:flutter/material.dart';

class AnimationFabCardProvider extends ChangeNotifier {

  static const Duration duration = Duration(milliseconds: 300);

  bool _isFabVisible = true;

  bool get isFabVisible {
    return _isFabVisible;
  }

  void swapIsFabVisible() {
    _isFabVisible = !_isFabVisible;
    notifyListeners();
  }

}