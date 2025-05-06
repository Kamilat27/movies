import 'package:final_project/model/news_model.dart';
import 'package:final_project/resources/imdb_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState>{
  final _repository = ImdbRepository();
  NewsBloc() : super(NewsInitial()){
    on<NewsEvent>(_repository.getNews);
  }

}