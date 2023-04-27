import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/Category.dart';

import 'package:http/http.dart' as http;

class CategoryProvider extends ChangeNotifier {
  List<int> selectedChoose = [];
  List<int> nameOfIdCategory = [];
  List<Category> _result = [];
  List<Category> get result => [..._result];
  void listenCategorySelected(int id) {
    if (selectedChoose.contains(id)) {
      selectedChoose.remove(id);
    } else {
      selectedChoose.add(id);
    }
  }

  List<String?>? getNameOfIdCatfory(List<int> id) {
    final names = id.map((id) {
      var category = _result.firstWhere((category) => category.id == id);
      return category != null ? category.name : null;
    }).toList();
    return names;
  }

  Future<List<Category>> getRequest(String url) async {
    final response = await http.get(Uri.parse(url));
    var responseData = json.decode(response.body);
    List<Category> data = List<Category>.from(
        responseData.map((i) => Category.fromJson(jsonEncode(i))));
    _result = data;
    return _result;
  }
}
