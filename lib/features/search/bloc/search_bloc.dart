import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../models/article_model.dart';
import '../../../repositories/newsapi_ai_repository.dart';


part 'search_event.dart';
part 'search_state.dart';


class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final NewsApiAiRepository _repository;

  SearchBloc(this._repository) : super(SearchLoadingState()) {
    on<SearchFetched>((event, emit) async {
      emit(SearchLoadingState());
      try{
        final List<ArticleModel> articles = await _repository.searchArticles(query: event.query);
        emit(SearchLoadedState(articles));
      }catch (e) {
        emit(SearchErrorState(e.toString()));
      }
    });
  }
}
