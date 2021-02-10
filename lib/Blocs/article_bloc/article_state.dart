import 'package:bloc_api/models/article_model.dart';
import 'package:equatable/equatable.dart';

class ArticlesState extends Equatable {
  final List<ArticleModel> allArticles;

  ArticlesState({this.allArticles});

  @override
  List<Object> get props => [allArticles];
}

class WaitingState extends ArticlesState {}

class SuccessState extends ArticlesState {
  final List<ArticleModel> allArticles;

  SuccessState(this.allArticles) : super(allArticles: allArticles);
}

class ErrorState extends ArticlesState{}
