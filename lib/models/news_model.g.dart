// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewsModelImpl _$$NewsModelImplFromJson(Map<String, dynamic> json) =>
    _$NewsModelImpl(
      hits: (json['hits'] as List<dynamic>?)
              ?.map((e) => Hits.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$NewsModelImplToJson(_$NewsModelImpl instance) =>
    <String, dynamic>{
      'hits': instance.hits,
    };

_$HitsImpl _$$HitsImplFromJson(Map<String, dynamic> json) => _$HitsImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      author: json['author'] as String? ?? '',
      title: json['title'] as String? ?? '',
      url: json['url'] as String? ?? '',
      createdAt: json['created_at'] as String? ?? '',
      updatedAt: json['updated_at'] as String? ?? '',
    );

Map<String, dynamic> _$$HitsImplToJson(_$HitsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'author': instance.author,
      'title': instance.title,
      'url': instance.url,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
