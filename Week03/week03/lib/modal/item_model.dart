// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/cupertino.dart';

class Item extends ChangeNotifier {
  String id;
  String name;
  String image;
  bool isFavorite = false;

  Item({
    required this.id,
    required this.name,
    required this.image,
  });

  void toggleIsFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
