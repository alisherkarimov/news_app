import 'package:flutter/material.dart';
import 'package:flutter_news_app/src/config/router.dart';
import 'package:flutter_news_app/src/core/routes.dart';
import 'package:flutter_news_app/src/data/datasources/remote/news_datasource_impl.dart';
import 'package:flutter_news_app/src/doman/repositories/news_repository_impl.dart';
import 'package:flutter_news_app/src/doman/usecases/news_use_case.dart';
import 'package:flutter_news_app/src/doman/usecases/news_use_case_impl.dart';
import 'package:flutter_news_app/src/presentation/provider/home_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NewsUseCase data =
        NewsUseCaseImpl(NewsRepositoryImpl(NewsDataSourceImpl()));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider(data))
      ],
      child: MaterialApp(
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            primarySwatch: Colors.blue),
        initialRoute: routeHome,
        onGenerateRoute: MyRouter.generateRoute,
      ),
    );
  }
}
