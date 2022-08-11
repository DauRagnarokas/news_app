part of 'article_bloc.dart';

abstract class ArticleEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ArticleFetched extends ArticleEvent {}
