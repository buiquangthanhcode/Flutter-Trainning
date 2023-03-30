import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../modal/item_model.dart';

class ItemProvide extends ChangeNotifier {
  List<Item> items = [];
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/item.json');
    List<dynamic> datas = await json.decode(response);
    List<Item> listData =
        List<Item>.from(datas.map((e) => Item.fromJson(jsonEncode(e))));
    items = listData;
    notifyListeners();
  }

  List<Item> getItems() {
    return [...items];
  }

  List<Item> itemsFavorites() {
    List<Item> data =
        items.where((element) => element.isFavorite == true).toList();
    return data.isEmpty ? [] : data;
  }

  void isToggleItem(index) {
    items[index].isFavorite = !items[index].isFavorite;
    notifyListeners();
  }

  int getAllItemFavorite() {
    return items.where((element) => element.isFavorite == true).toList().length;
  }
}
