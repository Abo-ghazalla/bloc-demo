import 'package:bloc_api/Blocs/article_bloc/article_event.dart';
import 'package:bloc_api/Blocs/article_bloc/article_state.dart';
import 'package:bloc_api/repos/repos_fun.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArticlesBloc extends Bloc<ArticleEvents, ArticlesState> {
  ArticlesBloc(ArticlesState initialState) : super(initialState);

  @override
  Stream<ArticlesState> mapEventToState(ArticleEvents event) async* {
    if (event is WaitingEvent) {
      yield WaitingState();
    }
    else{
      try {
        final allArtilcles = await getArticles();
        yield SuccessState(allArtilcles);
      } catch (_) {
        yield ErrorState();
      }
    }
  }
}
