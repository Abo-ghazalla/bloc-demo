import 'package:bloc_api/Blocs/article_bloc/article_bloc.dart';
import 'package:bloc_api/Blocs/article_bloc/article_event.dart';
import 'package:bloc_api/Blocs/article_bloc/article_state.dart';
import 'package:bloc_api/repos/repos_fun.dart';
import 'package:bloc_api/screens/all_articles_screen/widgets/the_image.dart';
import 'package:bloc_api/screens/articles_screen/articles_screen.dart';
import 'package:bloc_api/screens/articles_screen/widgets/top.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllArticles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<ArticlesBloc>(
        create: (_) => ArticlesBloc(WaitingState()),
        child: Builder(
          builder: (ctx) => BlocConsumer<ArticlesBloc, ArticlesState>(
            builder: (_, state) {
              if (state is WaitingState) {
                BlocProvider.of<ArticlesBloc>(ctx, listen: false)
                    .add(GetArticlesEvent());
                return Center(child: CircularProgressIndicator());
              }
              if (state is ErrorState) {
                return Center(
                  child: FlatButton(
                    child: Text("try again"),
                    onPressed: () {
                      BlocProvider.of<ArticlesBloc>(ctx, listen: false)
                          .add(WaitingEvent());
                    },
                  ),
                );
              }

              return Padding(
                child: Column(
                  children: [
                    Top(),
                    SizedBox(height: 25),
                    Text(
                      "Articles",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (_, i) => Column(
                          children: [
                            GestureDetector(
                              child: TheImage(
                                image:
                                    "$imageBase_URL/${state.allArticles[i].img}",
                              ),
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => ArticleScreen(
                                    image:
                                        "$imageBase_URL/${state.allArticles[i].img}",
                                    date: state.allArticles[i].created_at
                                        .substring(
                                            0,
                                            state.allArticles[i].created_at
                                                .indexOf("T")),
                                    name: state.allArticles[i].title,
                                    body: state.allArticles[i].description,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              state.allArticles[i].title,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              state.allArticles[i].created_at.substring(0,
                                  state.allArticles[i].created_at.indexOf("T")),
                              style: TextStyle(color: Colors.black),
                            ),
                            SizedBox(height: 16)
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                        itemCount: state.allArticles.length,
                        padding: EdgeInsets.only(top: 8),
                      ),
                    )
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
                padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: MediaQuery.of(context).padding.top + 16,
                ),
              );
            },
            listener: (_, state) {
              if (state is ErrorState) {
                showDialog(
                  context: ctx,
                  builder: (_) => AlertDialog(
                    title: Text("Error"),
                    content: Text("An Error Occurred"),
                  ),
                );
              }
            },
          ),
        ),
      ),
      backgroundColor: Color(0xFFE9E9E9),
    );
  }
}
