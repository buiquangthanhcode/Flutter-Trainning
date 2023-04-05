import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import '../modal/category.dart';

class CategoryProvider extends ChangeNotifier {
  List<Category> categories = [];
  int _current = 0;

  int get current => _current;

  set current(int value) {
    _current = value;
  }

  Future<List<Category>> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/category.json');
    List<dynamic> datas = await json.decode(response);
    List<Category> listData =
        List<Category>.from(datas.map((e) => Category.fromJson(jsonEncode(e))));
    categories = listData;
    return listData;
  }

  void setCurrent(int value) {
    _current = value;
    notifyListeners();
  }

  List<Category> getItems() {
    return [...categories];
  }
}
