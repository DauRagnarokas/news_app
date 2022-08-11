import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:intl/intl.dart';

import '../models/article_model.dart';

class DetailsScreen extends StatelessWidget {
  final ArticleModel article;

  const DetailsScreen({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final ArticleBloc counterBloc = BlocProvider.of<ArticleBloc>(context);
    return Scaffold(
      body: CustomScrollView(slivers: <Widget>[
        SliverAppBar(
          stretch: true,
          expandedHeight: 220.0,
          // pinned: true,
          // centerTitle: false,
          // leadingWidth: 0,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: const EdgeInsets.all(8),
            title: Text(article.title!),
            background: ImageFiltered(
                imageFilter: const ColorFilter.mode(Colors.grey, BlendMode.modulate),
                child: article.img == null
                    ? Image.asset("assets/img/placeholder.png", fit: BoxFit.cover)
                    : Image.network(article.img!, fit: BoxFit.cover),
          ),
          ),
        ),
        const SliverPadding(padding: EdgeInsets.only(top: 8)),
        SliverToBoxAdapter(
          child: Column(
            children: [
              Html(data: article.content),
              _moreDetails(),
            ],
          ),
        ),
      ]),
    );
  }

  _moreDetails() {
    final List<_PropertyModel> fields = [
      _PropertyModel(
          'Published At',
          DateFormat('yyyy-MM-dd – kk:mm')
              .format(DateTime.parse(article.publishedAt))),
      _PropertyModel('Source', article.source),
      _PropertyModel('Language', article.lang),
      _PropertyModel('Social Score', article.socialScore),
      _PropertyModel('Uri', article.uri),
      _PropertyModel('Url', article.url),
    ];
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            children: List.generate(
                fields.length, (index) => _detailItemRow(fields[index]))),
      ),
    );
  }

  _detailItemRow(_PropertyModel property) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: 100,
              child: Text(
                property.name,
                textAlign: TextAlign.right,
                style: const TextStyle(fontWeight: FontWeight.bold),
              )),
          const SizedBox(width: 8),
          Expanded(child: Text(property.value ?? '')),
        ],
      ),
    );
  }
}

class _PropertyModel {
  final String name;
  final String? value;

  _PropertyModel(this.name, this.value);
}
