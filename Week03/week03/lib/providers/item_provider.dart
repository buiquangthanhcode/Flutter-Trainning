import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../modal/item_model.dart';

class ItemProvide extends ChangeNotifier {
  List<Item> items = [
    Item(
      id: '1',
      name: 'Corporate Program Designer',
      image: 'assets/images/img3.jpeg',
    ),
    Item(
      id: '2',
      name: 'International Group Designer',
      image: 'assets/images/img4.jpeg',
    ),
    Item(
      id: '1',
      name: 'Future Operations Technician',
      image: 'assets/images/img5.jpeg',
    )
  ];

  List<Item> getItems() {
    return [...items];
  }

  void readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/item.json');
    final data = await json.decode(response);
    print(data);
  }
}
