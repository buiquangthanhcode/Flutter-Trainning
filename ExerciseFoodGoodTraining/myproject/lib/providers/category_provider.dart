import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../models/category_model.dart';

class CategoryProvider extends ChangeNotifier {
  List<Category> _categories =[];
  List<Category> get categories => [..._categories];
  Future<List<Category>> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/category.json');
    final dataDecode = await json.decode(response);
    List<Category> data = List<Category>.from(
        dataDecode.map((i) => Category.fromJson(jsonEncode(i))));
    _categories = data;
    return data;
  }
}
