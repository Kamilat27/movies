// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostsModel _$PostsModelFromJson(Map<String, dynamic> json) => PostsModel(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostsModelToJson(PostsModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      movies: json['movies'] == null
          ? null
          : Movies.fromJson(json['movies'] as Map<String, dynamic>),
      tv: json['tv'] == null
          ? null
          : Movies.fromJson(json['tv'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'movies': instance.movies,
      'tv': instance.tv,
    };

Movies _$MoviesFromJson(Map<String, dynamic> json) => Movies(
      typename: json['typename'] as String?,
      edges: (json['edges'] as List<dynamic>?)
          ?.map((e) => Edge.fromJson(e as Map<String, dynamic>))
          .toList(),
      pageInfo: json['pageInfo'] == null
          ? null
          : PageInfo.fromJson(json['pageInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MoviesToJson(Movies instance) => <String, dynamic>{
      'typename': instance.typename,
      'edges': instance.edges,
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
      typename: json['typename'] as String?,
      id: json['id'] as String?,
      titleText: json['titleText'] == null
          ? null
          : TitleText.fromJson(json['titleText'] as Map<String, dynamic>),
      originalTitleText: json['originalTitleText'] == null
          ? null
          : TitleText.fromJson(
              json['originalTitleText'] as Map<String, dynamic>),
      releaseYear: json['releaseYear'] == null
          ? null
          : ReleaseYear.fromJson(json['releaseYear'] as Map<String, dynamic>),
      releaseDate: json['releaseDate'] == null
          ? null
          : ReleaseDate.fromJson(json['releaseDate'] as Map<String, dynamic>),
      titleType: json['titleType'] == null
          ? null
          : TitleType.fromJson(json['titleType'] as Map<String, dynamic>),
      primaryImage: json['primaryImage'] == null
          ? null
          : PrimaryImage.fromJson(json['primaryImage'] as Map<String, dynamic>),
      metacritic: json['metacritic'] == null
          ? null
          : Metacritic.fromJson(json['metacritic'] as Map<String, dynamic>),
      principalCredits: (json['principalCredits'] as List<dynamic>?)
          ?.map((e) => PrincipalCredit.fromJson(e as Map<String, dynamic>))
          .toList(),
      certificate: json['certificate'] == null
          ? null
          : Certificate.fromJson(json['certificate'] as Map<String, dynamic>),
      plot: json['plot'] == null
          ? null
          : Plot.fromJson(json['plot'] as Map<String, dynamic>),
      titleGenres: json['titleGenres'] == null
          ? null
          : TitleGenres.fromJson(json['titleGenres'] as Map<String, dynamic>),
      ratingsSummary: json['ratingsSummary'] == null
          ? null
          : RatingsSummary.fromJson(
              json['ratingsSummary'] as Map<String, dynamic>),
      canRate: json['canRate'] == null
          ? null
          : CanRate.fromJson(json['canRate'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NodeToJson(Node instance) => <String, dynamic>{
      'typename': instance.typename,
      'id': instance.id,
      'titleText': instance.titleText,
      'originalTitleText': instance.originalTitleText,
      'releaseYear': instance.releaseYear,
      'releaseDate': instance.releaseDate,
      'titleType': instance.titleType,
      'primaryImage': instance.primaryImage,
      'metacritic': instance.metacritic,
      'principalCredits': instance.principalCredits,
      'certificate': instance.certificate,
      'plot': instance.plot,
      'titleGenres': instance.titleGenres,
      'ratingsSummary': instance.ratingsSummary,
      'canRate': instance.canRate,
    };

CanRate _$CanRateFromJson(Map<String, dynamic> json) => CanRate(
      isRatable: json['isRatable'] as bool?,
    );

Map<String, dynamic> _$CanRateToJson(CanRate instance) => <String, dynamic>{
      'isRatable': instance.isRatable,
    };

Certificate _$CertificateFromJson(Map<String, dynamic> json) => Certificate(
      id: json['id'] as String?,
      ratingsBody: json['ratingsBody'] == null
          ? null
          : RatingsBody.fromJson(json['ratingsBody'] as Map<String, dynamic>),
      ratingReason: json['ratingReason'] as String?,
      rating: json['rating'] as String?,
    );

Map<String, dynamic> _$CertificateToJson(Certificate instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ratingsBody': instance.ratingsBody,
      'ratingReason': instance.ratingReason,
      'rating': instance.rating,
    };

RatingsBody _$RatingsBodyFromJson(Map<String, dynamic> json) => RatingsBody(
      id: json['id'] as String?,
      text: json['text'] as String?,
    );

Map<String, dynamic> _$RatingsBodyToJson(RatingsBody instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
    };

Metacritic _$MetacriticFromJson(Map<String, dynamic> json) => Metacritic(
      metascore: json['metascore'] == null
          ? null
          : Metascore.fromJson(json['metascore'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MetacriticToJson(Metacritic instance) =>
    <String, dynamic>{
      'metascore': instance.metascore,
    };

Metascore _$MetascoreFromJson(Map<String, dynamic> json) => Metascore(
      score: (json['score'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MetascoreToJson(Metascore instance) => <String, dynamic>{
      'score': instance.score,
    };

TitleText _$TitleTextFromJson(Map<String, dynamic> json) => TitleText(
      text: json['text'] as String?,
      isOriginalTitle: json['isOriginalTitle'] as bool?,
    );

Map<String, dynamic> _$TitleTextToJson(TitleText instance) => <String, dynamic>{
      'text': instance.text,
      'isOriginalTitle': instance.isOriginalTitle,
    };

Plot _$PlotFromJson(Map<String, dynamic> json) => Plot(
      id: json['id'] as String?,
      plotText: json['plotText'] == null
          ? null
          : PlotText.fromJson(json['plotText'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlotToJson(Plot instance) => <String, dynamic>{
      'id': instance.id,
      'plotText': instance.plotText,
    };

PlotText _$PlotTextFromJson(Map<String, dynamic> json) => PlotText(
      plainText: json['plainText'] as String?,
    );

Map<String, dynamic> _$PlotTextToJson(PlotText instance) => <String, dynamic>{
      'plainText': instance.plainText,
    };

PrimaryImage _$PrimaryImageFromJson(Map<String, dynamic> json) => PrimaryImage(
      typename: json['typename'] as String?,
      id: json['id'] as String?,
      url: json['url'] as String?,
      height: (json['height'] as num?)?.toInt(),
      width: (json['width'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PrimaryImageToJson(PrimaryImage instance) =>
    <String, dynamic>{
      'typename': instance.typename,
      'id': instance.id,
      'url': instance.url,
      'height': instance.height,
      'width': instance.width,
    };

PrincipalCredit _$PrincipalCreditFromJson(Map<String, dynamic> json) =>
    PrincipalCredit(
      credits: (json['credits'] as List<dynamic>?)
          ?.map((e) => Credit.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PrincipalCreditToJson(PrincipalCredit instance) =>
    <String, dynamic>{
      'credits': instance.credits,
    };

Credit _$CreditFromJson(Map<String, dynamic> json) => Credit(
      name: json['name'] == null
          ? null
          : Name.fromJson(json['name'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreditToJson(Credit instance) => <String, dynamic>{
      'name': instance.name,
    };

Name _$NameFromJson(Map<String, dynamic> json) => Name(
      typename: json['typename'] as String?,
      id: json['id'] as String?,
      nameText: json['nameText'] == null
          ? null
          : NameText.fromJson(json['nameText'] as Map<String, dynamic>),
      primaryImage: json['primaryImage'] == null
          ? null
          : PrimaryImage.fromJson(json['primaryImage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NameToJson(Name instance) => <String, dynamic>{
      'typename': instance.typename,
      'id': instance.id,
      'nameText': instance.nameText,
      'primaryImage': instance.primaryImage,
    };

NameText _$NameTextFromJson(Map<String, dynamic> json) => NameText(
      text: json['text'] as String?,
    );

Map<String, dynamic> _$NameTextToJson(NameText instance) => <String, dynamic>{
      'text': instance.text,
    };

RatingsSummary _$RatingsSummaryFromJson(Map<String, dynamic> json) =>
    RatingsSummary(
      aggregateRating: (json['aggregateRating'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$RatingsSummaryToJson(RatingsSummary instance) =>
    <String, dynamic>{
      'aggregateRating': instance.aggregateRating,
    };

ReleaseDate _$ReleaseDateFromJson(Map<String, dynamic> json) => ReleaseDate(
      typename: json['typename'] as String?,
      month: (json['month'] as num?)?.toInt(),
      day: (json['day'] as num?)?.toInt(),
      year: (json['year'] as num?)?.toInt(),
      country: json['country'] == null
          ? null
          : Country.fromJson(json['country'] as Map<String, dynamic>),
      restriction: json['restriction'],
      attributes: (json['attributes'] as List<dynamic>?)
          ?.map((e) => RatingsBody.fromJson(e as Map<String, dynamic>))
          .toList(),
      displayableProperty: json['displayableProperty'] == null
          ? null
          : ReleaseDateDisplayableProperty.fromJson(
              json['displayableProperty'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReleaseDateToJson(ReleaseDate instance) =>
    <String, dynamic>{
      'typename': instance.typename,
      'month': instance.month,
      'day': instance.day,
      'year': instance.year,
      'country': instance.country,
      'restriction': instance.restriction,
      'attributes': instance.attributes,
      'displayableProperty': instance.displayableProperty,
    };

Country _$CountryFromJson(Map<String, dynamic> json) => Country(
      id: json['id'] as String?,
    );

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'id': instance.id,
    };

ReleaseDateDisplayableProperty _$ReleaseDateDisplayablePropertyFromJson(
        Map<String, dynamic> json) =>
    ReleaseDateDisplayableProperty(
      qualifiersInMarkdownList: json['qualifiersInMarkdownList'],
    );

Map<String, dynamic> _$ReleaseDateDisplayablePropertyToJson(
        ReleaseDateDisplayableProperty instance) =>
    <String, dynamic>{
      'qualifiersInMarkdownList': instance.qualifiersInMarkdownList,
    };

ReleaseYear _$ReleaseYearFromJson(Map<String, dynamic> json) => ReleaseYear(
      typename: json['typename'] as String?,
      year: (json['year'] as num?)?.toInt(),
      endYear: (json['endYear'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ReleaseYearToJson(ReleaseYear instance) =>
    <String, dynamic>{
      'typename': instance.typename,
      'year': instance.year,
      'endYear': instance.endYear,
    };

TitleGenres _$TitleGenresFromJson(Map<String, dynamic> json) => TitleGenres(
      typename: json['typename'] as String?,
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => GenreElement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TitleGenresToJson(TitleGenres instance) =>
    <String, dynamic>{
      'typename': instance.typename,
      'genres': instance.genres,
    };

GenreElement _$GenreElementFromJson(Map<String, dynamic> json) => GenreElement(
      genre: json['genre'] == null
          ? null
          : GenreGenre.fromJson(json['genre'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GenreElementToJson(GenreElement instance) =>
    <String, dynamic>{
      'genre': instance.genre,
    };

GenreGenre _$GenreGenreFromJson(Map<String, dynamic> json) => GenreGenre(
      genreId: json['genreId'] as String?,
      text: json['text'] as String?,
    );

Map<String, dynamic> _$GenreGenreToJson(GenreGenre instance) =>
    <String, dynamic>{
      'genreId': instance.genreId,
      'text': instance.text,
    };

TitleType _$TitleTypeFromJson(Map<String, dynamic> json) => TitleType(
      typename: json['typename'] as String?,
      id: json['id'] as String?,
      text: json['text'] as String?,
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      canHaveEpisodes: json['canHaveEpisodes'] as bool?,
      isEpisode: json['isEpisode'] as bool?,
      isSeries: json['isSeries'] as bool?,
      displayableProperty: json['displayableProperty'] == null
          ? null
          : TitleTypeDisplayableProperty.fromJson(
              json['displayableProperty'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TitleTypeToJson(TitleType instance) => <String, dynamic>{
      'typename': instance.typename,
      'id': instance.id,
      'text': instance.text,
      'categories': instance.categories,
      'canHaveEpisodes': instance.canHaveEpisodes,
      'isEpisode': instance.isEpisode,
      'isSeries': instance.isSeries,
      'displayableProperty': instance.displayableProperty,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: json['id'] as String?,
      text: json['text'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'value': instance.value,
    };

TitleTypeDisplayableProperty _$TitleTypeDisplayablePropertyFromJson(
        Map<String, dynamic> json) =>
    TitleTypeDisplayableProperty(
      value: json['value'] == null
          ? null
          : PlotText.fromJson(json['value'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TitleTypeDisplayablePropertyToJson(
        TitleTypeDisplayableProperty instance) =>
    <String, dynamic>{
      'value': instance.value,
    };

PageInfo _$PageInfoFromJson(Map<String, dynamic> json) => PageInfo(
      typename: json['typename'] as String?,
      hasNextPage: json['hasNextPage'] as bool?,
      hasPreviousPage: json['hasPreviousPage'] as bool?,
      startCursor: json['startCursor'] as String?,
      endCursor: json['endCursor'] as String?,
    );

Map<String, dynamic> _$PageInfoToJson(PageInfo instance) => <String, dynamic>{
      'typename': instance.typename,
      'hasNextPage': instance.hasNextPage,
      'hasPreviousPage': instance.hasPreviousPage,
      'startCursor': instance.startCursor,
      'endCursor': instance.endCursor,
    };
