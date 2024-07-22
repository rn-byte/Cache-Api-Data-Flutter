import 'package:bloc/bloc.dart';
import 'package:cache_api_data_flutter/bloc/news_events.dart';
import 'package:cache_api_data_flutter/bloc/news_state.dart';
import 'package:cache_api_data_flutter/data/response/api_response.dart';
import 'package:cache_api_data_flutter/repository/news_repo/news_repository.dart';

class NewsBloc extends Bloc<NewsEvents, NewsState> {
  NewsRepository newsRepository;
  NewsBloc({required this.newsRepository})
      : super(NewsState(newsList: ApiResponse.loading())) {
    on<FetchHackerNews>(fetchNewsList);
  }
  Future<void> fetchNewsList(
      FetchHackerNews event, Emitter<NewsState> emit) async {
    await newsRepository.fetchNewsList().then((value) {
      print(value.hits);
      emit(state.copyWith(newsList: ApiResponse.completed(value)));
    }).onError((error, stackTrace) {
      print(stackTrace);
      print(error);
      emit(state.copyWith(newsList: ApiResponse.error(error.toString())));
    });
  }
}
