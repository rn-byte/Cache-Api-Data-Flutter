import 'package:cache_api_data_flutter/data/response/api_response.dart';
import 'package:equatable/equatable.dart';
import '../models/news_model.dart';

class NewsState extends Equatable {
  final ApiResponse<NewsModel> newsList;
  const NewsState({required this.newsList});

  NewsState copyWith({ApiResponse<NewsModel>? newsList}) {
    return NewsState(newsList: newsList ?? this.newsList);
  }

  @override
  List<Object?> get props => [newsList];
}
