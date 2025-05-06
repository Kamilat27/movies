import 'package:json_annotation/json_annotation.dart';

part 'posts_model.g.dart';

@JsonSerializable()
class PostsModel {
  Data? data;

  PostsModel({this.data});

  factory PostsModel.fromJson(Map<String, dynamic> json) => _$PostsModelFromJson(json);
  Map<String, dynamic> toJson() => _$PostsModelToJson(this);
}

@JsonSerializable()
class Data {
  Movies? movies;
  Movies? tv;

  Data({this.movies, this.tv});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Movies {
  String? typename;
  List<Edge>? edges;
  PageInfo? pageInfo;

  Movies({this.typename, this.edges, this.pageInfo});

  factory Movies.fromJson(Map<String, dynamic> json) => _$MoviesFromJson(json);
  Map<String, dynamic> toJson() => _$MoviesToJson(this);
}

@JsonSerializable()
class Edge {
  Node? node;

  Edge({this.node});

  factory Edge.fromJson(Map<String, dynamic> json) => _$EdgeFromJson(json);
  Map<String, dynamic> toJson() => _$EdgeToJson(this);
}

@JsonSerializable()
class Node {
  String? typename;
  String? id;
  TitleText? titleText;
  TitleText? originalTitleText;
  ReleaseYear? releaseYear;
  ReleaseDate? releaseDate;
  TitleType? titleType;
  PrimaryImage? primaryImage;
  Metacritic? metacritic;
  List<PrincipalCredit>? principalCredits;
  Certificate? certificate;
  Plot? plot;
  TitleGenres? titleGenres;
  RatingsSummary? ratingsSummary;
  CanRate? canRate;

  Node({
    this.typename,
    this.id,
    this.titleText,
    this.originalTitleText,
    this.releaseYear,
    this.releaseDate,
    this.titleType,
    this.primaryImage,
    this.metacritic,
    this.principalCredits,
    this.certificate,
    this.plot,
    this.titleGenres,
    this.ratingsSummary,
    this.canRate,
  });

  factory Node.fromJson(Map<String, dynamic> json) => _$NodeFromJson(json);
  Map<String, dynamic> toJson() => _$NodeToJson(this);
}

@JsonSerializable()
class CanRate {
  bool? isRatable;

  CanRate({this.isRatable});

  factory CanRate.fromJson(Map<String, dynamic> json) => _$CanRateFromJson(json);
  Map<String, dynamic> toJson() => _$CanRateToJson(this);
}

@JsonSerializable()
class Certificate {
  String? id;
  RatingsBody? ratingsBody;
  String? ratingReason;
  String? rating;

  Certificate({this.id, this.ratingsBody, this.ratingReason, this.rating});

  factory Certificate.fromJson(Map<String, dynamic> json) => _$CertificateFromJson(json);
  Map<String, dynamic> toJson() => _$CertificateToJson(this);
}

@JsonSerializable()
class RatingsBody {
  String? id;
  String? text;

  RatingsBody({this.id, this.text});

  factory RatingsBody.fromJson(Map<String, dynamic> json) => _$RatingsBodyFromJson(json);
  Map<String, dynamic> toJson() => _$RatingsBodyToJson(this);
}

@JsonSerializable()
class Metacritic {
  Metascore? metascore;

  Metacritic({this.metascore});

  factory Metacritic.fromJson(Map<String, dynamic> json) => _$MetacriticFromJson(json);
  Map<String, dynamic> toJson() => _$MetacriticToJson(this);
}

@JsonSerializable()
class Metascore {
  int? score;

  Metascore({this.score});

  factory Metascore.fromJson(Map<String, dynamic> json) => _$MetascoreFromJson(json);
  Map<String, dynamic> toJson() => _$MetascoreToJson(this);
}

@JsonSerializable()
class TitleText {
  String? text;
  bool? isOriginalTitle;

  TitleText({this.text, this.isOriginalTitle});

  factory TitleText.fromJson(Map<String, dynamic> json) => _$TitleTextFromJson(json);
  Map<String, dynamic> toJson() => _$TitleTextToJson(this);
}

@JsonSerializable()
class Plot {
  String? id;
  PlotText? plotText;

  Plot({this.id, this.plotText});

  factory Plot.fromJson(Map<String, dynamic> json) => _$PlotFromJson(json);
  Map<String, dynamic> toJson() => _$PlotToJson(this);
}

@JsonSerializable()
class PlotText {
  String? plainText;

  PlotText({this.plainText});

  factory PlotText.fromJson(Map<String, dynamic> json) => _$PlotTextFromJson(json);
  Map<String, dynamic> toJson() => _$PlotTextToJson(this);
}

@JsonSerializable()
class PrimaryImage {
  String? typename;
  String? id;
  String? url;
  int? height;
  int? width;

  PrimaryImage({this.typename, this.id, this.url, this.height, this.width});

  factory PrimaryImage.fromJson(Map<String, dynamic> json) => _$PrimaryImageFromJson(json);
  Map<String, dynamic> toJson() => _$PrimaryImageToJson(this);
}

@JsonSerializable()
class PrincipalCredit {
  List<Credit>? credits;

  PrincipalCredit({this.credits});

  factory PrincipalCredit.fromJson(Map<String, dynamic> json) => _$PrincipalCreditFromJson(json);
  Map<String, dynamic> toJson() => _$PrincipalCreditToJson(this);
}

@JsonSerializable()
class Credit {
  Name? name;

  Credit({this.name});

  factory Credit.fromJson(Map<String, dynamic> json) => _$CreditFromJson(json);
  Map<String, dynamic> toJson() => _$CreditToJson(this);
}

@JsonSerializable()
class Name {
  String? typename;
  String? id;
  NameText? nameText;
  PrimaryImage? primaryImage;

  Name({this.typename, this.id, this.nameText, this.primaryImage});

  factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);
  Map<String, dynamic> toJson() => _$NameToJson(this);
}

@JsonSerializable()
class NameText {
  String? text;

  NameText({this.text});

  factory NameText.fromJson(Map<String, dynamic> json) => _$NameTextFromJson(json);
  Map<String, dynamic> toJson() => _$NameTextToJson(this);
}

@JsonSerializable()
class RatingsSummary {
  double? aggregateRating;

  RatingsSummary({this.aggregateRating});

  factory RatingsSummary.fromJson(Map<String, dynamic> json) => _$RatingsSummaryFromJson(json);
  Map<String, dynamic> toJson() => _$RatingsSummaryToJson(this);
}

@JsonSerializable()
class ReleaseDate {
  String? typename;
  int? month;
  int? day;
  int? year;
  Country? country;
  dynamic restriction;
  List<RatingsBody>? attributes;
  ReleaseDateDisplayableProperty? displayableProperty;

  ReleaseDate({this.typename, this.month, this.day, this.year, this.country, this.restriction, this.attributes, this.displayableProperty});

  factory ReleaseDate.fromJson(Map<String, dynamic> json) => _$ReleaseDateFromJson(json);
  Map<String, dynamic> toJson() => _$ReleaseDateToJson(this);
}

@JsonSerializable()
class Country {
  String? id;

  Country({this.id});

  factory Country.fromJson(Map<String, dynamic> json) => _$CountryFromJson(json);
  Map<String, dynamic> toJson() => _$CountryToJson(this);
}

@JsonSerializable()
class ReleaseDateDisplayableProperty {
  dynamic qualifiersInMarkdownList;

  ReleaseDateDisplayableProperty({this.qualifiersInMarkdownList});

  factory ReleaseDateDisplayableProperty.fromJson(Map<String, dynamic> json) => _$ReleaseDateDisplayablePropertyFromJson(json);
  Map<String, dynamic> toJson() => _$ReleaseDateDisplayablePropertyToJson(this);
}

@JsonSerializable()
class ReleaseYear {
  String? typename;
  int? year;
  int? endYear;

  ReleaseYear({this.typename, this.year, this.endYear});

  factory ReleaseYear.fromJson(Map<String, dynamic> json) => _$ReleaseYearFromJson(json);
  Map<String, dynamic> toJson() => _$ReleaseYearToJson(this);
}

@JsonSerializable()
class TitleGenres {
  String? typename;
  List<GenreElement>? genres;

  TitleGenres({this.typename, this.genres});

  factory TitleGenres.fromJson(Map<String, dynamic> json) => _$TitleGenresFromJson(json);
  Map<String, dynamic> toJson() => _$TitleGenresToJson(this);
}

@JsonSerializable()
class GenreElement {
  GenreGenre? genre;

  GenreElement({this.genre});

  factory GenreElement.fromJson(Map<String, dynamic> json) => _$GenreElementFromJson(json);
  Map<String, dynamic> toJson() => _$GenreElementToJson(this);
}

@JsonSerializable()
class GenreGenre {
  String? genreId;
  String? text;

  GenreGenre({this.genreId, this.text});

  factory GenreGenre.fromJson(Map<String, dynamic> json) => _$GenreGenreFromJson(json);
  Map<String, dynamic> toJson() => _$GenreGenreToJson(this);
}

@JsonSerializable()
class TitleType {
  String? typename;
  String? id;
  String? text;
  List<Category>? categories;
  bool? canHaveEpisodes;
  bool? isEpisode;
  bool? isSeries;
  TitleTypeDisplayableProperty? displayableProperty;

  TitleType({this.typename, this.id, this.text, this.categories, this.canHaveEpisodes, this.isEpisode, this.isSeries, this.displayableProperty});

  factory TitleType.fromJson(Map<String, dynamic> json) => _$TitleTypeFromJson(json);
  Map<String, dynamic> toJson() => _$TitleTypeToJson(this);
}

@JsonSerializable()
class Category {
  String? id;
  String? text;
  String? value;

  Category({this.id, this.text, this.value});

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

@JsonSerializable()
class TitleTypeDisplayableProperty {
  PlotText? value;

  TitleTypeDisplayableProperty({this.value});

  factory TitleTypeDisplayableProperty.fromJson(Map<String, dynamic> json) => _$TitleTypeDisplayablePropertyFromJson(json);
  Map<String, dynamic> toJson() => _$TitleTypeDisplayablePropertyToJson(this);
}

@JsonSerializable()
class PageInfo {
  String? typename;
  bool? hasNextPage;
  bool? hasPreviousPage;
  String? startCursor;
  String? endCursor;

  PageInfo({this.typename, this.hasNextPage, this.hasPreviousPage, this.startCursor, this.endCursor});

  factory PageInfo.fromJson(Map<String, dynamic> json) => _$PageInfoFromJson(json);
  Map<String, dynamic> toJson() => _$PageInfoToJson(this);
}
