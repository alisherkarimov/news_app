import 'package:flutter/material.dart';
import 'package:flutter_news_app/src/config/routes.dart';
import 'package:flutter_news_app/src/core/routes.dart';
import 'package:flutter_news_app/src/presentation/provider/dataclass.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (context) => DataClass())],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          primarySwatch: Colors.blue),
      initialRoute: routeHome,
      onGenerateRoute: MyRouter.generateRoute,
    );
  }
}
