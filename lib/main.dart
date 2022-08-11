import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/search/bloc/search_bloc.dart';
import 'package:news_app/repositories/newsapi_ai_repository.dart';
import 'package:news_app/screens/home_screen.dart';
import 'features/articles/bloc/article_bloc.dart';
import 'features/theme/bloc/theme_bloc.dart';

void main() {
  runApp(const App());
}


class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
        create: (_) => NewsApiAiRepository(),
        child: MultiBlocProvider(
          providers: [
            BlocProvider<ThemeBloc>(
              create: (_) => ThemeBloc(),
            ),
            BlocProvider<SearchBloc>(
              create: (BuildContext context) =>
                  SearchBloc(RepositoryProvider.of<NewsApiAiRepository>(context))
                    ..add(SearchFetched(NewsApiAiRepository.defaultQuery)),
            ),
            BlocProvider<ArticleBloc>(
              create: (BuildContext context) => ArticleBloc(
                  RepositoryProvider.of<NewsApiAiRepository>(context))
                ..add(ArticleFetched()),
            ),
          ],
          child: BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              return MaterialApp(
                theme: state.themeData,
                debugShowCheckedModeBanner: false,
                home: const HomeScreen(),
              );
            },
          ),
        ));
  }
}
