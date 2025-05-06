import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/bloc/news_bloc/news_bloc.dart';
import 'package:final_project/constants/app_colors.dart';
import 'package:final_project/constants/app_styles.dart';
import 'package:final_project/model/news_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late NewsBloc newsBloc;


  @override
  void initState(){
    super.initState();
    newsBloc = NewsBloc();
    newsBloc.add(GetNewsEvent());
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(

       backgroundColor: AppColors.bodyBackground,

       body: BlocBuilder(
          bloc: newsBloc,
          builder: (BuildContext context, state){
            if(state is NewsLoading){
              return Center(
                child: Lottie.asset('assets/animations/loading_camera.json', height: 130)
              );
            }
            if(state is NewsSuccess){
              List<Edge> news = state.news.data!.news!.edges!;

              return ListView.builder(
                  itemCount: news.length,
                  itemBuilder: (context, index) {
                    Node anew = news[index].node!;
                    String formattedDate = DateFormat("MMMM d, y | HH:mm").format(anew.date!);

                    return Container(
                      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                        height: 380,
                        width: 280,
                        child: Card(
                          shadowColor: Colors.orange,
                          elevation: 3,
                          color: AppColors.cardBackground,
                          clipBehavior: Clip.hardEdge,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                          child: Stack(
                            children: [
                              Column(

                              children: [

                                Container(
                                  height: 230,
                                  // clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(

                                    image: DecorationImage(image: NetworkImage(anew.image!.url!, ),
                                    fit: BoxFit.cover, )
                                  ),
                                ),
                                SizedBox(height: 2,),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(

                                        children: [
                                          Text("By ",
                                            style: AppTextStyles.subtitle,
                                          ),
                                          Text(anew.source!.homepage!.label!,
                                            style: AppTextStyles.source,
                                          ),

                                        ],
                                      ),
                                      SizedBox(height: 5,),
                                      Text(anew.articleTitle!.plainText!,
                                        style: AppTextStyles.title,
                                        maxLines: 3,
                                        softWrap: true,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                              Positioned(
                                bottom: 10,
                                right: 10,
                                child:
                                Text(formattedDate
                                  // " ${ Date anew.date!.month } ${anew.date!.day}, ${anew.date!.year} ${anew.date!.hour}:${anew.date!.minute}"

                                  ,
                                  style: AppTextStyles.plotDescription,
                                ),
                              )
                            ],
                          ),

                        )
                    );
                  }
              );

            }
            if(state is NewsError){
              return Center(child: Text(state.message, style: TextStyle(color: AppColors.appText),),);
            }
            return Text("Nothing works");
          }

       ),

    );
  }
}
