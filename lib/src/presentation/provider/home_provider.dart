import 'package:flutter/material.dart';
import 'package:flutter_news_app/src/doman/usecases/news_use_case.dart';

import '../../data/model/news_model.dart';

class HomeProvider with ChangeNotifier {
  NewsUseCase newsUseCase;

  HomeProvider(this.newsUseCase);

  bool isLoading = false;
  List<Articles> data = [];

  Future<void> getData() async {
    isLoading = true;
    notifyListeners();
    List<Articles> data = await newsUseCase.fetchDataAPI();
    this.data.clear();
    this.data.addAll(data);
    isLoading = false;
    notifyListeners();
  }
}
