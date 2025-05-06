import 'dart:ffi';

import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/bloc/posts_bloc/posts_bloc.dart';
import 'package:final_project/constants/app_colors.dart';
import 'package:final_project/constants/app_styles.dart';
import 'package:final_project/model/posts_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  late PostsBloc postsBloc;
  late Movies posts;

  @override
  void initState(){
    super.initState();
    postsBloc = PostsBloc();
    postsBloc.add(GetPostsEvent());
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.bodyBackground,
      body: BlocBuilder(
          bloc: postsBloc,
          builder: (BuildContext context, state){
            if(state is PostsLoading){
              return Center(child: Lottie.asset('assets/animations/loading_camera.json', height: 130));
            };

            if(state is PostsSuccess){
              List<Edge> posts = state.posts.data!.movies!.edges!;

              return ListView.builder(
                itemCount: posts.length,
                // itemExtent: 50.0,
                itemBuilder: (context, index) {
                  Node post = posts[index].node!;
                  List<GenreElement> genres = post.titleGenres!.genres!;
                  double rating = post.ratingsSummary?.aggregateRating ?? 0.0;
                  return Stack(
                    children: [Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 0.1,
                              color: AppColors.icon
                          )),
                      height: 180,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(

                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width:120,

                              decoration: BoxDecoration(
                                  image: DecorationImage(image: NetworkImage(post.primaryImage!.url!), fit: BoxFit.fitHeight)
                              ),),
                            SizedBox(width: 5,),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(post.titleText!.text!,
                                    style: AppTextStyles.title,
                                    textWidthBasis: TextWidthBasis.parent,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                    maxLines: 2,),
                                  SizedBox(height: 3,),
                                  Text("${post.releaseYear?.year}", style: AppTextStyles.subtitle,),
                                  SizedBox(height: 3,),
                                  Wrap(
                                      children: List.generate(
                                          genres.length,
                                              (index)=> Text( "${genres[index].genre!.text!} ${index < genres.length - 1? "• " : "" }",
                                            style: AppTextStyles.genres,
                                          ))
                                  ),

                                  SizedBox(height: 4,),
                                  Text("${post.plot?.plotText?.plainText} ",
                                    style: AppTextStyles.plotDescription,
                                    maxLines: 6,
                                    softWrap: true,
                                    overflow: TextOverflow.fade,


                                  ),

                                ],
                              ),
                            )

                          ],


                        ),
                      ),
                    ),
                      Positioned(
                        bottom: 10,
                        right: 3,
                        child: Container(
                          padding: const EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                            color: rating != null
                                ? (rating > 7.0
                                ? AppColors.highRating
                                : (rating > 4.0 ? AppColors.mediumRating : AppColors.lowRating))
                                : Colors.grey,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            rating != null ? rating.toStringAsFixed(1) : "-",
                            style: AppTextStyles.rating,
                          ),
                        ),
                      ),
                    ],

                  );
                }

              );
            }

            if(state is PostsError){
              print(state.message);
              return Center(child: Text(state.message, style: TextStyle(color: AppColors.appText)
              ),
              );
            }

            return Text("Something went wrong", style: TextStyle(color: AppColors.appText),);
          })
    );
  }
}
