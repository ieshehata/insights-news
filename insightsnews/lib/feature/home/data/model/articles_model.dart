



import 'package:insightsnews/feature/home/data/model/source_model.dart';

class Article {
  final SourceModel? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  Article(
      {required this.source,
        required this.title,
        required this.author,
        required this.content,
        required this.publishedAt,
        required this.urlToImage,
        required this.url,
        required this.description});

  factory Article.fromJson(Map<String, dynamic> json) => Article(
    source: json['source'] == null
        ? null
        : SourceModel.fromJson(json['source'] as Map<String, dynamic>),
    author: json['author'] as String?,
    title: json['title'] as String?,
    description: json['description'] as String?,
    url: json['url'] as String?,
    urlToImage: json['urlToImage'] as String?,
    publishedAt: json['publishedAt'] as String?,
    content: json['content'] as String?,
  );

  Map<String, dynamic> toJson() => {

    'source': source?.toJson(),
    'author': author,
    'title': title,
    'description': description,
    'url': url,
    'urlToImage': urlToImage,
    'publishedAt': publishedAt,
    'content': content,
  };
}
