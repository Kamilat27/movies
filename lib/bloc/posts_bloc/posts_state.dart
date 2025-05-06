part of 'posts_bloc.dart';

sealed class PostsState{}

final class PostsInitial extends PostsState{}

final class PostsLoading extends PostsState{}

final class PostsSuccess extends PostsState{
  final PostsModel posts;

  PostsSuccess(this.posts);
}

final class PostsError extends PostsState{
  final String message;

  PostsError(this.message);
}