import 'dart:convert';

import 'package:week06/models/Category.dart';

class Articles {
  int id;
  String title;
  String description;
  String content;
  String thumb;
  int category_id;
  String publish_date;
  String created_at;
  String updated_at;
  String slug;
  String link;
  String author;
  int is_crawl;
  int status;
  int user_id;
  Category category;
  Articles({
    required this.id,
    required this.title,
    required this.description,
    required this.content,
    required this.thumb,
    required this.category_id,
    required this.publish_date,
    required this.created_at,
    required this.updated_at,
    required this.slug,
    required this.link,
    required this.author,
    required this.is_crawl,
    required this.status,
    required this.user_id,
    required this.category,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'title': title});
    result.addAll({'description': description});
    result.addAll({'content': content});
    result.addAll({'thump': thumb});
    result.addAll({'category_id': category_id});
    result.addAll({'publish_date': publish_date});
    result.addAll({'created_at': created_at});
    result.addAll({'updated_at': updated_at});
    result.addAll({'slug': slug});
    result.addAll({'link': link});
    result.addAll({'author': author});
    result.addAll({'is_crawl': is_crawl});
    result.addAll({'status': status});
    result.addAll({'user_id': user_id});
    result.addAll({'category': category.toMap()});

    return result;
  }

  factory Articles.fromMap(Map<String, dynamic> map) {
    return Articles(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      content: map['content'] ?? '',
      thumb: map['thumb'] ?? '',
      category_id: map['category_id']?.toInt() ?? 0,
      publish_date: map['publish_date'] ?? '',
      created_at: map['created_at'] ?? '',
      updated_at: map['updated_at'] ?? '',
      slug: map['slug'] ?? '',
      link: map['link'] ?? '',
      author: map['author'] ?? '',
      is_crawl: map['is_crawl']?.toInt() ?? 0,
      status: map['status']?.toInt() ?? 0,
      user_id: map['user_id']?.toInt() ?? 0,
      category: Category.fromMap(map['category']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Articles.fromJson(String source) =>
      Articles.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Articles(id: $id, title: $title, description: $description, content: $content, thump: $thumb, category_id: $category_id, publish_date: $publish_date, created_at: $created_at, updated_at: $updated_at, slug: $slug, link: $link, author: $author, is_crawl: $is_crawl, status: $status, user_id: $user_id, category: $category)';
  }
}
