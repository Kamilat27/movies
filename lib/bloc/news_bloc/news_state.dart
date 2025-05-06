part of 'news_bloc.dart';

sealed class NewsState{}

final class NewsInitial extends NewsState{}

final class NewsLoading extends NewsState{}

final class NewsSuccess extends NewsState{
  final NewsModel news;

  NewsSuccess(this.news);
}

final class NewsError extends NewsState{
  final String message;

  NewsError(this.message);
}