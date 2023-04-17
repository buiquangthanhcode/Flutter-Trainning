import 'dart:convert';

class Category {
  String id;
  String name;
  String _image;
  String get image => _image;

  set image(String value) {
    _image = value;
  }
  Category({
    required this.id,
    required this.name,
    required String image,
  }) : _image = image;

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'image': image});
  
    return result;
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) => Category.fromMap(json.decode(source));

  @override
  String toString() => 'Category(id: $id, name: $name, image: $image)';
}
