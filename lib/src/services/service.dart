import 'dart:convert';
import 'package:flutter_news_app/src/model/news_model.dart';
import 'package:http/http.dart';

class DataService {
  static Future<List<Articles>> fetchDataAPI() async {
    const String baseUri = "https://newsapi.org/v2/everything?";
    const String apiKey = "apiKey=ccb4da2c10874c06a1086c1a222f7f85";
    const String jsonUri = 'q=tesla&from=2022-07-26&sortBy=publishedAt&';
    Response res = await get(Uri.parse(baseUri + jsonUri + apiKey));
    final json = jsonDecode(res.body);
    NewsModel result = NewsModel.fromJson(json);
    return result.articles!;
  }
}
