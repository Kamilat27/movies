import 'package:json_annotation/json_annotation.dart';

part 'news_model.g.dart';

@JsonSerializable()
class NewsModel {
  final Data? data;

  NewsModel({this.data});

  factory NewsModel.fromJson(Map<String, dynamic> json) => _$NewsModelFromJson(json);
  Map<String, dynamic> toJson() => _$NewsModelToJson(this);
}

@JsonSerializable()
class Data {
  final News? news;

  Data({this.news});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class News {
  @JsonKey(name: '__typename')
  final String? typename;

  @JsonKey(defaultValue: [], disallowNullValue: true)
  final List<Edge>? edges;

  final int? total;
  final PageInfo? pageInfo;

  News({this.typename, this.edges, this.total, this.pageInfo});

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
  Map<String, dynamic> toJson() => _$NewsToJson(this);
}

@JsonSerializable()
class Edge {
  final Node? node;

  Edge({this.node});

  factory Edge.fromJson(Map<String, dynamic> json) => _$EdgeFromJson(json);
  Map<String, dynamic> toJson() => _$EdgeToJson(this);
}

@JsonSerializable()
class Node {
  @JsonKey(name: '__typename')
  final NodeTypename? typename;

  final String? id;
  final String? byline;
  final DateTime? date;
  final String? externalUrl;
  final ArticleTitle? articleTitle;
  final Image? image;
  final ArticleTitle? text;
  final Source? source;

  Node({
    this.typename,
    this.id,
    this.byline,
    this.date,
    this.externalUrl,
    this.articleTitle,
    this.image,
    this.text,
    this.source,
  });

  factory Node.fromJson(Map<String, dynamic> json) => _$NodeFromJson(json);
  Map<String, dynamic> toJson() => _$NodeToJson(this);
}

@JsonSerializable()
class ArticleTitle {
  final String? plainText;

  ArticleTitle({this.plainText});

  factory ArticleTitle.fromJson(Map<String, dynamic> json) => _$ArticleTitleFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleTitleToJson(this);
}

@JsonSerializable()
class Image {
  @JsonKey(name: '__typename')
  final ImageTypename? typename;

  final String? id;
  final String? url;
  final int? height;
  final int? width;

  Image({this.typename, this.id, this.url, this.height, this.width});

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
  Map<String, dynamic> toJson() => _$ImageToJson(this);
}

@JsonEnum()
enum ImageTypename {
  @JsonValue("Image")
  IMAGE,
}

@JsonSerializable()
class Source {
  final Homepage? homepage;
  final dynamic description;

  Source({this.homepage, this.description});

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
  Map<String, dynamic> toJson() => _$SourceToJson(this);
}

@JsonSerializable()
class Homepage {
  final String? url;
  final String? label;

  Homepage({this.url, this.label});

  factory Homepage.fromJson(Map<String, dynamic> json) => _$HomepageFromJson(json);
  Map<String, dynamic> toJson() => _$HomepageToJson(this);
}

@JsonEnum()
enum NodeTypename {
  @JsonValue("News")
  NEWS,
}

@JsonSerializable()
class PageInfo {
  @JsonKey(name: '__typename')
  final String? typename;

  final bool? hasNextPage;
  final String? endCursor;

  PageInfo({this.typename, this.hasNextPage, this.endCursor});

  factory PageInfo.fromJson(Map<String, dynamic> json) => _$PageInfoFromJson(json);
  Map<String, dynamic> toJson() => _$PageInfoToJson(this);
}
