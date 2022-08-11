import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../models/article_model.dart';
import '../../../repositories/newsapi_ai_repository.dart';

part 'article_event.dart';
part 'article_state.dart';


class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final NewsApiAiRepository _repository;

  ArticleBloc(this._repository) : super(ArticleLoadingState()) {
    on<ArticleFetched>((event, emit) async {
      emit(ArticleLoadingState());
      try{
        final List<ArticleModel> articles = await _repository.getRecentArticles();
        emit(ArticleLoadedState(articles));
      }catch (e) {
        emit(ArticleErrorState(e.toString()));
      }
    });
  }
}
