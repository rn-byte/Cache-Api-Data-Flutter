// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'news_model.freezed.dart';
part 'news_model.g.dart';

@freezed
class NewsModel with _$NewsModel {
  factory NewsModel({
    @Default([]) @JsonKey(name: 'hits') List<Hits> hits,
  }) = _NewsModel;

  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);
}

@freezed
class Hits with _$Hits {
  factory Hits({
    @Default(0) @JsonKey(name: 'story_id') int id,
    @Default('') @JsonKey(name: 'author') String author,
    @Default('') @JsonKey(name: 'title') String title,
    @Default('') @JsonKey(name: 'url') String url,
    @Default('') @JsonKey(name: 'created_at') String createdAt,
    @Default('') @JsonKey(name: 'updated_at') String updatedAt,
  }) = _Hits;

  factory Hits.fromJson(Map<String, dynamic> json) => _$HitsFromJson(json);
}
