import 'package:news_app/feature/news/domain/entities/news_Category_entity.dart';

class NewsCategoryModel extends NewsEntity {
  NewsCategoryModel({
    required super.title,
    required super.description,
    required super.url,
    required super.urlToImage,
  });

  factory NewsCategoryModel.fromJson(Map<String, dynamic> json) {
    return NewsCategoryModel(
      title: json['title'],
      description: json["description"],
      url: json["url"],
      urlToImage: json["urlToImage"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
      "url": url,
      "urlTOImage": urlToImage,
    };
  }

  NewsCategoryModel copyWith({
    String? title,
    String? description,
    String? url,
    String? urlToImage,
  }) {
    return NewsCategoryModel(
      title: title ?? this.title,
      description: description ?? this.description,
      url: url ?? this.url,
      urlToImage: urlToImage ?? this.urlToImage,
    );
  }
}
