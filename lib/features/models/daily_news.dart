class DailyNewsModel {
  final List<DailyNews> articles;

  DailyNewsModel({required this.articles});

  factory DailyNewsModel.fromJson(Map<String, dynamic> json) {
    var list = json['articles'] as List;
    List<DailyNews> articlesList =
        list.map((i) => DailyNews.fromJson(i)).toList();

    return DailyNewsModel(articles: articlesList);
  }
}

class DailyNews {
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;

  DailyNews({
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
  });

  factory DailyNews.fromJson(Map<String, dynamic> json) {
    return DailyNews(
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
    );
  }
}

class DailyNewsRequest {
  final String country;
  final String category;
  final String apiKey;

  DailyNewsRequest({
    required this.country,
    required this.category,
    required this.apiKey,
  });

  Map<String, dynamic> toJson() {
    return {'country': country, 'category': category, 'apiKey': apiKey};
  }
}
