import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import '../modal/category.dart';
class CategoryProvider extends ChangeNotifier {
  List<Category> categories = [];
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/category.json');
    List<dynamic> datas = await json.decode(response);
    List<Category> listData =
        List<Category>.from(datas.map((e) => Category.fromJson(jsonEncode(e))));
    categories = listData;
    notifyListeners();
  }

  List<Category> getItems() {
    return [...categories];
  }
}
