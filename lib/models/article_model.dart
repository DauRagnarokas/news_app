import 'package:timeago/timeago.dart' as timeago;

const String _undefined = 'N/A';

class ArticleModel {
  final String? source;
  final String? title;
  final String uri;
  final String? url;
  final String? lang;
  final String? img;
  final String? socialScore;
  final String publishedAt;
  final String? content;

  ArticleModel(
      {
      this.source,
      this.title,
      required this.uri,
      this.url,
      this.lang,
      this.img,
      this.socialScore,
      required this.publishedAt,
      this.content}
  );

  ArticleModel.fromJson(Map<String, dynamic> json)
      :
        source = json["source"]["title"] ?? _undefined,
        title = json["title"] ?? _undefined,
        uri = json["uri"],
        url = json["url"],
        img = json["image"] ,
        socialScore = json["socialScore"] ?? _undefined,
        lang = json["lang"] ?? _undefined,
        publishedAt = json["dateTime"],
        content = json["body" ] ?? _undefined;

  String publishedAgo() {
    var publishedAtDate = DateTime.parse(publishedAt);
    return timeago.format(publishedAtDate, allowFromNow: true);
  }
}
