import 'package:cache_api_data_flutter/config/app_url.dart';
import 'package:cache_api_data_flutter/data/network/network_api_service.dart';
import 'package:cache_api_data_flutter/models/news_model.dart';
import 'package:cache_api_data_flutter/repository/news_repo/news_repository.dart';

class NewsHttpApiRepository implements NewsRepository {
  final _apiService = NetworkApiService();
  @override
  Future<NewsModel> fetchNewsList() async {
    final response = await _apiService.getApi(AppUrl.newsUrl);
    return NewsModel.fromJson(response);
  }
}
