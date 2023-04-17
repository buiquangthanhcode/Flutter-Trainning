import 'dart:convert';
import 'package:flutter/material.dart';

class Product extends ChangeNotifier {
  String id;
  String _categoryId;
  String title;
  String image;
  String intro;
  String ingredients;
  String instructions;
  String view;
  String favorite;
  bool isFavorite = false;
  bool isSeen = false;
  String get categoryId => _categoryId;

  set categoryId(String value) {
    _categoryId = value;
  }

  Product({
    required this.id,
    required String categoryId,
    required this.title,
    required this.image,
    required this.intro,
    required this.ingredients,
    required this.instructions,
    required this.view,
    required this.favorite,
    required this.isFavorite,
    required this.isSeen,
  }) : _categoryId = categoryId;

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'categoryId': categoryId});
    result.addAll({'title': title});
    result.addAll({'image': image});
    result.addAll({'intro': intro});
    result.addAll({'ingredients': ingredients});
    result.addAll({'instructions': instructions});
    result.addAll({'view': view});
    result.addAll({'favorite': favorite});
    result.addAll({'isFavorite': isFavorite});
    result.addAll({'isSeen': isSeen});

    return result;
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] ?? '',
      categoryId: map['categoryId'] ?? '',
      title: map['title'] ?? '',
      image: map['image'] ?? '',
      intro: map['intro'] ?? '',
      ingredients: map['ingredients'] ?? '',
      instructions: map['instructions'] ?? '',
      view: map['view'] ?? '',
      favorite: map['favorite'] ?? '',
      isFavorite: map['isFavorite'] ?? false,
      isSeen: map['isSeen'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Product(id: $id, categoryId: $categoryId, title: $title, image: $image, intro: $intro, ingredients: $ingredients, instructions: $instructions, view: $view, favorite: $favorite, isFavorite: $isFavorite, isSeen: $isSeen)';
  }

  void toggleIsFavorite() {
    isFavorite = !isFavorite;
    favorite = isFavorite
        ? (int.parse(favorite) + 1).toString()
        : (int.parse(favorite) - 1).toString();
    notifyListeners();
  }

  void toggleIsSeen() {
    isSeen = true;
    view = (int.parse(view) + 1).toString();
    notifyListeners();
  }

  void handleRemoveIsFavorite() {
    isFavorite = false;
    favorite = (int.parse(favorite) - 1).toString();
  }

  void handleRemoveIsSeen() {
    isSeen = false;
  }
}
