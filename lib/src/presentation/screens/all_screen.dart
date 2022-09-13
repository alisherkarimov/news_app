import 'package:flutter/material.dart';
import 'package:flutter_news_app/src/presentation/provider/home_provider.dart';
import 'package:provider/provider.dart';

import '../../data/model/news_model.dart';
import '../widget/posts.dart';

class AllPage extends StatelessWidget {
  const AllPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, value, child) {
        if (value.isLoading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(
              backgroundColor: Colors.white,
            ),
          );
        } else {
          List<Articles> data = value.data;
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return BuildPost(
                data[index].title ?? '',
                data[index].urlToImage ?? '',
                data[index].description ?? '',
                data[index].publishedAt ?? '',
                data[index].source!.name ?? '',
              );
            },
          );
        }
      },
    );
  }
}
