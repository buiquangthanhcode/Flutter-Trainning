import 'dart:convert';



class Category {
  int _id;
  String _name;
  String _slug;
  String _link;
  String _created_at;
  String _updated_at;

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get slug => _slug;

  set slug(String value) {
    _slug = value;
  }

  String get link => _link;

  set link(String value) {
    _link = value;
  }

  String get created_at => _created_at;

  set created_at(String value) {
    _created_at = value;
  }

  String get updated_at => _updated_at;

  set updated_at(String value) {
    _updated_at = value;
  }

  Category({
    required int id,
    required String name,
    required String slug,
    required String link,
    required String created_at,
    required String updated_at,
  })  : _updated_at = updated_at,
        _created_at = created_at,
        _link = link,
        _slug = slug,
        _name = name,
        _id = id;

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'slug': slug});
    result.addAll({'link': link});
    result.addAll({'created_at': created_at});
    result.addAll({'updated_at': updated_at});

    return result;
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      slug: map['slug'] ?? '',
      link: map['link'] ?? '',
      created_at: map['created_at'] ?? '',
      updated_at: map['updated_at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source));

  
  @override
  String toString() {
    return 'Category(_id: $_id, _name: $_name, _slug: $_slug, _link: $_link, _created_at: $_created_at, _updated_at: $_updated_at)';
  }
}
