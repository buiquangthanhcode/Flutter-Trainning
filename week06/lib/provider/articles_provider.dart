import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:week06/models/articles.dart';

import 'package:http/http.dart' as http;

class ArticleProvider extends ChangeNotifier {
  

Future<List<Articles>> getRequest(String url) async {
    final response = await http.get(Uri.parse(url));
    var responseData = json.decode(response.body);
    List<Articles> result = [];
    List<Articles> data = List<Articles>.from(
        responseData.map((i) => Articles.fromJson(jsonEncode(i))));
    result = data;
    return result;
  }
}