import 'package:cache_api_data_flutter/repository/news_repo/news_http_api_repository.dart';
import 'package:cache_api_data_flutter/repository/news_repo/news_repository.dart';
import 'package:cache_api_data_flutter/views/home_views.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void main() {
  serviceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeViews(),
    );
  }
}

void serviceLocator() {
  getIt.registerLazySingleton<NewsRepository>(() => NewsHttpApiRepository());
}
