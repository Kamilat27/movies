import 'package:dio/dio.dart';
import 'package:final_project/model/news_model.dart';
import 'package:final_project/model/posts_model.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: 'https://imdb8.p.rapidapi.com/')
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;

  @GET('news/v2/get-by-category')
    Future<NewsModel> getNews({
      @Query("category") String category = "MOVIE",
      @Query("first") int first = 20,
      @Query("country") String country = "US",
      @Query("language") String language = "en-US",
  });

  @GET("/title/v2/get-popular")
  Future<PostsModel> getPosts({
    @Query("first") int first = 20,
    @Query("country") String country = "US",
    @Query("language") String language = "en-US",
  });
}

