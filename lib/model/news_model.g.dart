// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsModel _$NewsModelFromJson(Map<String, dynamic> json) => NewsModel(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NewsModelToJson(NewsModel instance) => <String, dynamic>{
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      news: json['news'] == null
          ? null
          : News.fromJson(json['news'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'news': instance.news,
    };

News _$NewsFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    disallowNullValues: const ['edges'],
  );
  return News(
    typename: json['__typename'] as String?,
    edges: (json['edges'] as List<dynamic>?)
            ?.map((e) => Edge.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    total: (json['total'] as num?)?.toInt(),
    pageInfo: json['pageInfo'] == null
        ? null
        : PageInfo.fromJson(json['pageInfo'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      '__typename': instance.typename,
      if (instance.edges case final value?) 'edges': value,
      'total': instance.total,
      'pageInfo': instance.pageInfo,
    };

Edge _$EdgeFromJson(Map<String, dynamic> json) => Edge(
      node: json['node'] == null
          ? null
          : Node.fromJson(json['node'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EdgeToJson(Edge instance) => <String, dynamic>{
      'node': instance.node,
    };

Node _$NodeFromJson(Map<String, dynamic> json) => Node(
      typename: $enumDecodeNullable(_$NodeTypenameEnumMap, json['__typename']),
      id: json['id'] as String?,
      byline: json['byline'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      externalUrl: json['externalUrl'] as String?,
      articleTitle: json['articleTitle'] == null
          ? null
          : ArticleTitle.fromJson(json['articleTitle'] as Map<String, dynamic>),
      image: json['image'] == null
          ? null
          : Image.fromJson(json['image'] as Map<String, dynamic>),
      text: json['text'] == null
          ? null
          : ArticleTitle.fromJson(json['text'] as Map<String, dynamic>),
      source: json['source'] == null
          ? null
          : Source.fromJson(json['source'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NodeToJson(Node instance) => <String, dynamic>{
      '__typename': _$NodeTypenameEnumMap[instance.typename],
      'id': instance.id,
      'byline': instance.byline,
      'date': instance.date?.toIso8601String(),
      'externalUrl': instance.externalUrl,
      'articleTitle': instance.articleTitle,
      'image': instance.image,
      'text': instance.text,
      'source': instance.source,
    };

const _$NodeTypenameEnumMap = {
  NodeTypename.NEWS: 'News',
};

ArticleTitle _$ArticleTitleFromJson(Map<String, dynamic> json) => ArticleTitle(
      plainText: json['plainText'] as String?,
    );

Map<String, dynamic> _$ArticleTitleToJson(ArticleTitle instance) =>
    <String, dynamic>{
      'plainText': instance.plainText,
    };

Image _$ImageFromJson(Map<String, dynamic> json) => Image(
      typename: $enumDecodeNullable(_$ImageTypenameEnumMap, json['__typename']),
      id: json['id'] as String?,
      url: json['url'] as String?,
      height: (json['height'] as num?)?.toInt(),
      width: (json['width'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ImageToJson(Image instance) => <String, dynamic>{
      '__typename': _$ImageTypenameEnumMap[instance.typename],
      'id': instance.id,
      'url': instance.url,
      'height': instance.height,
      'width': instance.width,
    };

const _$ImageTypenameEnumMap = {
  ImageTypename.IMAGE: 'Image',
};

Source _$SourceFromJson(Map<String, dynamic> json) => Source(
      homepage: json['homepage'] == null
          ? null
          : Homepage.fromJson(json['homepage'] as Map<String, dynamic>),
      description: json['description'],
    );

Map<String, dynamic> _$SourceToJson(Source instance) => <String, dynamic>{
      'homepage': instance.homepage,
      'description': instance.description,
    };

Homepage _$HomepageFromJson(Map<String, dynamic> json) => Homepage(
      url: json['url'] as String?,
      label: json['label'] as String?,
    );

Map<String, dynamic> _$HomepageToJson(Homepage instance) => <String, dynamic>{
      'url': instance.url,
      'label': instance.label,
    };

PageInfo _$PageInfoFromJson(Map<String, dynamic> json) => PageInfo(
      typename: json['__typename'] as String?,
      hasNextPage: json['hasNextPage'] as bool?,
      endCursor: json['endCursor'] as String?,
    );

Map<String, dynamic> _$PageInfoToJson(PageInfo instance) => <String, dynamic>{
      '__typename': instance.typename,
      'hasNextPage': instance.hasNextPage,
      'endCursor': instance.endCursor,
    };
