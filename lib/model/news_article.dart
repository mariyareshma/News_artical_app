class NewsArticals {
  NewsArticals({
    required this.pagination,
    required this.data,
  });

  final Pagination? pagination;
  final List<NewsArical> data;

  factory NewsArticals.fromJson(Map<String, dynamic> json) {
    return NewsArticals(
      pagination: json["pagination"] == null
          ? null
          : Pagination.fromJson(json["pagination"]),
      data: json["data"] == null
          ? []
          : List<NewsArical>.from(
              json["data"]!.map((x) => NewsArical.fromJson(x))),
    );
  }
}

class NewsArical {
  NewsArical({
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

  factory NewsArical.fromJson(Map<String, dynamic> json) {
    return NewsArical(
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
