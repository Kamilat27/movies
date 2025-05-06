import 'package:dio/dio.dart';

class RestApiDio {
  // Singleton instance
  static final RestApiDio _instance = RestApiDio._internal();

  // Dio instance
  late final Dio _dio;

  // Factory constructor returns the singleton
  factory RestApiDio() => _instance;

  // Private constructor
  RestApiDio._internal() {
    final options = BaseOptions(
      baseUrl: 'https://imdb8.p.rapidapi.com/',
      headers: {
        'x-rapidapi-key': 'cb546e7ea8mshd39370aee8394c7p156c8bjsn7445b2b5c06f',
        'x-rapidapi-host': 'imdb8.p.rapidapi.com',
        'Content-Type': 'application/json',
      },
    );

    _dio = Dio(options);
  }

  Dio get client => _dio;
}
