import 'package:flutter/material.dart';
import 'package:news_app/feature/news/domain/entities/news_Category_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NewsList extends StatefulWidget {
  final List<NewsEntity> newslist;
  const NewsList({required this.newslist});

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.newslist.length,
      itemBuilder: (context, index) {
        final news = widget.newslist[index];
        return Card(
          margin: EdgeInsets.all(8.0),
          child: Row(
            spacing: 7.0,
            children: [
              SizedBox(width: 5),
              SizedBox(
                width: 280,
                child: Text(
                  news.title,
                  maxLines: 8,

                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.black),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: news.urlToImage,
                  height: 100,
                  width: 80,
                  placeholder:
                      (context, url) =>
                          Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
