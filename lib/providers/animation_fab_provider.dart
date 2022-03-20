import 'package:flutter/material.dart';

class AnimationFabProvider extends ChangeNotifier {

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
