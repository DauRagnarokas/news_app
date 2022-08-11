import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/articles/ui/widgets/articles_carousel_widget.dart';
import 'package:news_app/features/search/bloc/search_bloc.dart';
import 'package:news_app/features/theme/ui/theme_switcher_widget.dart';
import '../features/articles/bloc/article_bloc.dart';
import '../features/search/ui/widgets/articles_vertical_list_widget.dart';
import '../features/search/ui/widgets/search_field_widget.dart';
import '../repositories/newsapi_ai_repository.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
            return <Widget>[
              createSilverAppBar1(context),
              createSilverAppBar2(context)
            ];
          },
          body: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
            if (state is SearchErrorState) {
              return Text(
                state.message,
                style: const TextStyle(fontSize: 16, color: Colors.red),
              );
            } else if (state is SearchLoadedState) {
              return Padding(
                padding: const EdgeInsets.all(8),
                child: ArticlesVerticalListWidget(articles: state.models),
              );
            }
            return const Center(
              child: CircularProgressIndicator(
              ),
            );
          })),
    );
  }

  SliverAppBar createSilverAppBar1(context) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      expandedHeight: 280,
      floating: false,
      elevation: 0,
      // title: Text('Title', style: Theme.of(context).textTheme.headline1,),
      flexibleSpace: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return FlexibleSpaceBar(
          collapseMode: CollapseMode.parallax,
          background: Container(
            color: Theme.of(context).canvasColor,
            child: Column(
              children: [
                AppBar(
                  centerTitle: true,
                  title: const Text('NEWS', style: TextStyle(fontWeight: FontWeight.bold),),
                  foregroundColor: Theme.of(context).canvasColor,
                  actions: const [
                    ThemeSwitcherWidget()
                  ],

                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: BlocProvider<ArticleBloc>(
                    create: (context) => ArticleBloc(
                        RepositoryProvider.of<NewsApiAiRepository>(context))
                      ..add(ArticleFetched()),
                    child: BlocBuilder<ArticleBloc, ArticleState>(
                        builder: (context, state) {
                      if (state is ArticleErrorState) {
                        return Text(
                          state.message,
                          style: const TextStyle(
                              fontSize: 16, color: Colors.red),
                        );
                      } else if (state is ArticleLoadedState) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 0),
                          child: ArticlesCarouselWidget(
                              articles: state.models),
                        );
                      }
                      return const SizedBox();
                    }),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  SliverAppBar createSilverAppBar2(context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).primaryColor,
      pinned: true,
      title: Container(
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.withOpacity(0.6),
                offset: const Offset(1.1, 1.1),
                blurRadius: 5.0),
          ],
        ),
        child: const SearchFieldWidget(),
      ),
    );
  }

}
