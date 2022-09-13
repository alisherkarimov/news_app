import 'package:flutter_news_app/src/data/model/news_model.dart';

abstract class NewsDataSource{
  Future<List<Articles>> fetchDataAPI();
}