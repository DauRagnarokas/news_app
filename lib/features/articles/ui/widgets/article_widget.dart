import 'package:flutter/material.dart';
import '../../../../models/article_model.dart';
import '../../../../screens/details_screen.dart';



class ArticleWidget extends StatelessWidget {
  const ArticleWidget({Key? key, required this.article, this.titleFontSize = 18, this.redTime = false})
      : super(key: key);

  final ArticleModel article;
  final double titleFontSize;
  final bool redTime;

  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: AspectRatio(
        aspectRatio: 16/9,
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: [
            Ink.image(
              colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.modulate),
              fit: BoxFit.cover,
              image: article.img == null
                  ? Image.asset("assets/img/placeholder.png")
                  .image
                  : Image.network(article.img!).image,
              // highlightColor: color,
              // splashColor: color,
              child: InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailsScreen(article: article)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
              child: IgnorePointer(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(article.source!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text(article.title!,maxLines: 3, style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white, fontWeight: FontWeight.bold, fontSize: titleFontSize)),
                    const SizedBox(height: 8),
                    redTime ?
                        Container(padding: const EdgeInsets.symmetric(horizontal: 4), decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(30.0),
                        ), child: Text(article.publishedAgo(), style: const TextStyle(color: Colors.white),))
 :
                    Text(article.publishedAgo(), style: const TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );

  }


}
