import 'package:flutter/widgets.dart';

class ItemProvide extends ChangeNotifier {
  int _far = 0;
  int get far => _far;
  void updateFar() {
    _far++;
    notifyListeners();

  }
}
