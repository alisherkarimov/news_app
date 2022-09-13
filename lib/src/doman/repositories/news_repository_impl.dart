import 'package:flutter_news_app/src/data/datasources/remote/news_datasource.dart';
import 'package:flutter_news_app/src/data/model/news_model.dart';

import 'news_repository.dart';

class NewsRepositoryImpl extends NewsRepository {
  NewsDataSource newsDataSource;

  NewsRepositoryImpl(this.newsDataSource);

  @override
  Future<List<Articles>> fetchDataAPI() {
    return newsDataSource.fetchDataAPI();
  }
}
