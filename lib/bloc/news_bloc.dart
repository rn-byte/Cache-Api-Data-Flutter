import 'package:bloc/bloc.dart';
import 'package:cache_api_data_flutter/bloc/news_events.dart';
import 'package:cache_api_data_flutter/bloc/news_state.dart';
import 'package:cache_api_data_flutter/data/response/api_response.dart';
import 'package:cache_api_data_flutter/repository/news_repo/news_repository.dart';
import 'package:cache_api_data_flutter/services/local_storage/local_database.dart';
import 'package:flutter/material.dart';

class NewsBloc extends Bloc<NewsEvents, NewsState> {
  NewsRepository newsRepository;
  NewsBloc({required this.newsRepository})
      : super(NewsState(newsList: ApiResponse.loading())) {
    on<FetchHackerNews>(fetchNewsList);
  }
  Future<void> fetchNewsList(
      FetchHackerNews event, Emitter<NewsState> emit) async {
    await newsRepository.fetchNewsList().then((value) {
      debugPrint(LocalDatabase.getNews().toString());
      for (var dt in value.hits) {
        //debugPrint(dt);
        LocalDatabase.insertNews(dt).then((value) {
          debugPrint('Successful');
        }).onError((error, stackTrace) {
          debugPrint('Database Error :${error.toString()}');
        });
      }
      emit(state.copyWith(newsList: ApiResponse.completed(value)));
    }).onError((error, stackTrace) {
      debugPrint(stackTrace.toString());
      debugPrint(error.toString());
      emit(state.copyWith(newsList: ApiResponse.error(error.toString())));
    });
  }
}
