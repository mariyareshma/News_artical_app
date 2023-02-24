import 'package:intl/intl.dart';

class NewsArticles {
  NewsArticles({
    required this.pagination,
    required this.data,
  });

  final Pagination? pagination;
  final List<NewsArticle> data;

  factory NewsArticles.fromJson(Map<String, dynamic> json) {
    return NewsArticles(
      pagination: json["pagination"] == null
          ? null
          : Pagination.fromJson(json["pagination"]),
      data: json["data"] == null
          ? []
          : List<NewsArticle>.from(
              json["data"]!.map((x) => NewsArticle.fromJson(x))),
    );
  }
}

class NewsArticle {
  NewsArticle({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.source,
    required this.image,
    required this.category,
    required this.language,
    required this.country,
    required this.publishedAt,
  });

  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? source;
  final String? image;
  final String? category;
  final String? language;
  final String? country;
  final DateTime? publishedAt;

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      author: json["author"],
      title: json["title"],
      description: json["description"],
      url: json["url"],
      source: json["source"],
      image: json["image"],
      category: json["category"],
      language: json["language"],
      country: json["country"],
      publishedAt: DateTime.tryParse(json["published_at"]),
    );
  }
  String articleDate() {
    if (publishedAt != null) {
      return DateFormat('dd-MMM').format(publishedAt!);
    }
    return '';
  }
}

class Pagination {
  Pagination({
    required this.limit,
    required this.offset,
    required this.count,
    required this.total,
  });

  final int? limit;
  final int? offset;
  final int? count;
  final int? total;

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      limit: json["limit"],
      offset: json["offset"],
      count: json["count"],
      total: json["total"],
    );
  }
}
