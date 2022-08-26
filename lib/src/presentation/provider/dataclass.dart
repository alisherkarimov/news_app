import 'package:flutter/material.dart';
import 'package:flutter_news_app/src/model/news_model.dart';
import 'package:flutter_news_app/src/services/service.dart';
class DataClass with ChangeNotifier {

  Future<List<Articles>> getData() {
    return DataService.fetchDataAPI();
  }
}
