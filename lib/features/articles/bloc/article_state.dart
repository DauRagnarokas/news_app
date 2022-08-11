part of 'article_bloc.dart';

abstract class ArticleState {}

class ArticleLoadingState extends ArticleState {}

class ArticleErrorState extends ArticleState {
  final String message;
  ArticleErrorState(this.message);
}

class ArticleLoadedState extends ArticleState {
  final List<ArticleModel> models;
  ArticleLoadedState(this.models);
}
