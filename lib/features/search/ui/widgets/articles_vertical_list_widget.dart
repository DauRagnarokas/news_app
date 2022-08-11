import 'package:flutter/material.dart';
import '../../../../models/article_model.dart';
import '../../../articles/ui/widgets/article_widget.dart';

class ArticlesVerticalListWidget extends StatelessWidget {
  const ArticlesVerticalListWidget({Key? key, required this.articles}) : super(key: key);
final List<ArticleModel> articles;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(padding: EdgeInsets.zero,
      itemCount: articles.length,
      itemBuilder: (context, index) => ArticleWidget(
          article: articles[index],
         ),
    );
  }
}
