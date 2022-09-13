import 'package:flutter_news_app/src/data/model/news_model.dart';

abstract class NewsUseCase {
  Future<List<Articles>> fetchDataAPI();
}
