part of 'search_bloc.dart';

abstract class SearchState {}

class SearchLoadingState extends SearchState {}

class SearchErrorState extends SearchState {
  final String message;
  SearchErrorState(this.message);
}

class SearchLoadedState extends SearchState {
  final List<ArticleModel> models;
  SearchLoadedState(this.models);
}
