import 'package:flutter/material.dart';
import '../../../../models/article_model.dart';
import 'article_widget.dart';

class ArticlesHorizontalListWidget extends StatelessWidget {
  const ArticlesHorizontalListWidget({Key? key, required this.articles})
      : super(key: key);
  final List<ArticleModel> articles;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: articles.length,
        itemBuilder: (context, index) => SizedBox(
          width: MediaQuery.of(context).size.width / 1.4,
          child: ArticleWidget(
            article: articles[index],
          ),
        ),
      ),
    );
  }
}
