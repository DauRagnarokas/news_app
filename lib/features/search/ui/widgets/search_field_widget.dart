import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/search/bloc/search_bloc.dart';

class SearchFieldWidget extends StatelessWidget {
  const  SearchFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      // controller: _filter,
      keyboardType: TextInputType.text,
      placeholder: 'Search',
      prefix:  Padding(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 8),
        child: Icon(
          Icons.search,
          size: 18,
          color: Theme.of(context).textTheme.subtitle1!.color?.withOpacity(0.8),
        ),
      ),
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(8.0),
      //   // color: Theme,
      // ),
      onSubmitted: (value) => submitCityName(context, value),
    );
  }

  void submitCityName(BuildContext context, String query) {
    final searchBloc = context.read<SearchBloc>();
    searchBloc.add(SearchFetched(query));
  }
}
