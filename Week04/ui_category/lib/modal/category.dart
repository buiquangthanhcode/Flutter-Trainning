import 'dart:convert';
import 'dart:ffi';

class Category {
  var id = 0;
  var name = "";
  var description = "";
  var image = "";
  Category({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
      'description': description,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'] as int,
      name: map['name'] as String,
      image: map['image'] as String,
      description:  map['description'] as String,
    );
  }
  String toJson() => json.encode(toMap());
  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source) as Map<String, dynamic>);
 
}
