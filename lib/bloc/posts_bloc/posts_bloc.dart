import 'package:final_project/model/posts_model.dart';
import 'package:final_project/resources/imdb_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState>{
  final _repository = ImdbRepository();

  PostsBloc() : super(PostsInitial()){
    on<PostsEvent>(_repository.getPosts);
  }
}