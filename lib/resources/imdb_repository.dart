import 'package:final_project/api/dio.dart';
import 'package:final_project/api/rest_client.dart';
import 'package:final_project/bloc/news_bloc/news_bloc.dart';
import 'package:final_project/bloc/posts_bloc/posts_bloc.dart';
import 'package:final_project/model/news_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImdbRepository {
  final _restClient = RestClient(RestApiDio().client);
  Future<void> getNews(
      NewsEvent event, Emitter<NewsState> emit) async {
    emit(NewsLoading());
    try {

      final NewsModel news = await _restClient.getNews();
      emit(NewsSuccess(news));


    } catch (e) {
      emit(NewsError(e.toString()));
    }
  }

  Future<void> getPosts(
      PostsEvent event, Emitter<PostsState> emit) async {
    emit(PostsLoading());
    try {

      final posts = await _restClient.getPosts();
      emit(PostsSuccess(posts));


    } catch (e) {
      emit(PostsError(e.toString()));
    }
  }

}