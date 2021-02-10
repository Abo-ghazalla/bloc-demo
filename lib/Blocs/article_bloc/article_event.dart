import 'package:equatable/equatable.dart';

abstract class ArticleEvents extends Equatable{
  @override
  List<Object> get props => [];
}

class GetArticlesEvent extends ArticleEvents{}

class WaitingEvent extends ArticleEvents{}