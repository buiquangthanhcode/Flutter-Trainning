import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/product_model.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> _products = [];
  List<Product> get products => [..._products];
  Future<List<Product>> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/product.json');
    final dataDecode = await json.decode(response);
    List<Product> data = List<Product>.from(
        dataDecode.map((i) => Product.fromJson(jsonEncode(i))));
    _products = data;
    return data;
  }

  List<Product> getItemsWithCategoryId(categoryId) {
    return _products
        .where((element) => element.categoryId == categoryId)
        .toList();
  }
  Product getItemWithId(id) {
    return _products.singleWhere((element) => element.id == id);
  }
    List<Product> getItemsIsFavorite() {
    return _products.where((element) => element.isFavorite).toList();
  }

  List<Product> getItemsIsSeen() {
    return _products.where((element) => element.isSeen).toList();
  }
  

}
