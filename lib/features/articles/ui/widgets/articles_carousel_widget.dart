import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../models/article_model.dart';
import 'article_widget.dart';

class ArticlesCarouselWidget extends StatefulWidget {
  const ArticlesCarouselWidget({Key? key, required this.articles})
      : super(key: key);
  final List<ArticleModel> articles;

  @override
  State<ArticlesCarouselWidget> createState() => _ArticlesCarouselWidgetState();
}

class _ArticlesCarouselWidgetState extends State<ArticlesCarouselWidget> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: widget.articles.length,
          options: CarouselOptions(
              initialPage: 0,
              height: 180,
              aspectRatio: 16 / 9,
              autoPlay: true,
              onPageChanged: (index, reason) {
                setState(() {
                  activeIndex = index;
                });
              }),
          itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
              SizedBox(
                height: 200,
                  child: ArticleWidget(redTime: true, titleFontSize: 14,
                    article: widget.articles[itemIndex],
                  )      ),
        ),
        const SizedBox(height: 8),
        _buildIndicator()
      ],
    );
  }

  _buildIndicator() => AnimatedSmoothIndicator(
activeIndex: activeIndex,effect: const ScrollingDotsEffect(
      dotHeight: 10,
      dotWidth: 10,
  ),
    count: widget.articles.length,
      );
}
