part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SearchFetched extends SearchEvent {
  final String query;

  SearchFetched(this.query);

}
