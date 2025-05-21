import 'package:equatable/equatable.dart';

class NewsEntity extends Equatable {
  final String title;
  final String description;
  final String url;
  final String urlToImage;

  NewsEntity({
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
  });

  @override
  List<Object?> get props => [title, description, url, urlToImage];
}
