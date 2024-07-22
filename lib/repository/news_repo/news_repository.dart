import '../../models/news_model.dart';

abstract class NewsRepository {
  Future<NewsModel> fetchNewsList();
}
