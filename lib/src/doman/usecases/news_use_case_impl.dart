import 'package:flutter_news_app/src/data/model/news_model.dart';
import 'package:flutter_news_app/src/doman/repositories/news_repository.dart';

import 'news_use_case.dart';

class NewsUseCaseImpl extends NewsUseCase {
  NewsRepository newsRepository;

  NewsUseCaseImpl(this.newsRepository);

  @override
  Future<List<Articles>> fetchDataAPI() {
    return newsRepository.fetchDataAPI();
  }
}
