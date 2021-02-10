import 'dart:convert';

import 'package:bloc_api/models/article_model.dart';
import 'package:http/http.dart' as http;


const api_URL = 'https://gotfit.net/api';
const imageBase_URL = 'https://gotfit.net/public/storage/';

Future<List<ArticleModel>> getArticles() async {
  try {
    final response = await http.get("$api_URL/articles");
    final data = json.decode(response.body)["articles"] as List;
    return data
        .map((articleData) => ArticleModel.fromJson(articleData))
        .toList();
  } catch (e) {
    throw e;
  }
}